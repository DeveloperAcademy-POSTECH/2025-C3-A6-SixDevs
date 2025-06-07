//
//  PartyDetailViewModel.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/2/25.
//

/*
필요한 기능들

파이어 베이스 관련
 - 파티 정보 가져오기
 - 파티 정보 수정하기
 - 파티 정보 삭제하기

파티장 관련
 - 파티에 속해있는 유저 내보내기
 - 참여 신청 유저 수락/거절 하기
 - 파티 정보 수정하기
 - 파티 상태 변경하기 (마감, 공구 종료, 모집 재개)

 파티원 관련
 - 파티 탈퇴하기
 -

공통 유저 관련
 - 댓글 달기
 - 파티 참여 신청
 - 파티 참여 신청 취소
 - 관심 파티 설정

파티 관련 기능
 - 좋아요 수 반영하기
 - 댓글 개수 카운팅
 - 조회수 실시간 변경
 - 파티 정보 업데이트
 - 현재 유저 정보 가져오기
 - 현재 유저가 파티에서 어떤 상태인지(파티장,파티원,참여 신청중, 일반유저)
 - 파티 참여 인원 충족시 자동 마감
*/

/*
파일 구조

 ViewModels/
 └── PartyDetail/
     ├── PartyDetailInfoViewModel.swift        파티 정보 관련
     ├── PartyHostActionViewModel.swift        파티장 기능
     ├── PartyMemberActionViewModel.swift      파티원 기능
     ├── PartyUserActionViewModel.swift        공통 유저 기능
     └── PartyRoleManager.swift                현재 유저의 역할 판단 + 자동 마감
*/

import Combine
import Foundation

// 메인 쓰레드에서만 실행되도록
@MainActor
class PartyDetailViewModel: ObservableObject {

    // MARK: - Published 프로퍼티
    @Published var party: Party?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    @Published var isLiked: Bool = false
    @Published var currentUserRole: UserRole = .guest
    @Published var comments: [PartyComment] = []

    // MARK: - Private 프로퍼티
    private let firestoreManager = FirestoreManager.shared
    private var cancellables = Set<AnyCancellable>()
    private var partyID: String
    private var viewCountUpdated = false

    // MARK: - Inititialization
    init(partyID: String) {
        self.partyID = partyID
        setupObservers()
    }

    // MARK: - User Role Enum
    enum UserRole {
        case host
        case member
        case waitingMember
        case guest
    }
    
    // MARK: - 계산 관련 프로퍼티
    var particiapntMemberCount: Int {
        party?.member.count ?? 0
    }

    var commentCount: Int {
        party?.comments.count ?? 0
    }

    var isHost: Bool {
        guard let party = party else { return false }
        return party.writen.id == getCurrentUserID()
    }

    var isParticipant: Bool {
        guard let party = party else { return false }
        return party.member.contains { $0.id == getCurrentUserID() }
    }

    var isWaitingMember: Bool {
        guard let party = party else { return false }
        return party.waitingMembers.contains { $0.id == getCurrentUserID() }
    }

    var isRecruitmentComplete: Bool {
        guard let party = party else { return false }
        return party.status != .recruiting
    }

    var buttonTitle: String {
        switch currentUserRole {
        case .host:
            return party?.status == .recruiting ? "파티 마감하기" : "공구 종료하기"
        case .member:
            return "참여중"
        case .waitingMember:
            return "참여 신청중"
        case .guest:
            return isRecruitmentComplete ? "모집 완료" : "파티 참여하기"
        }
    }

    var isActionButtonEnabled: Bool {
        guard let party = party else { return false }
        return party.status != .completed
    }

    // MARK: - Party Detail Info
    // 파티 정보 가져오기
    func fetchPartyDetail() async {
        isLoading = true

        do {
            // 파티 정보 가져오기
            let fetchedParty: Party? = try await firestoreManager.get(
                partyID,
                collectionType: .party
            )

            guard let fetchedParty = fetchedParty else {
                throw PartyDetailError.partyNotFound
            }

            self.party = fetchedParty

            // 현재 유저 역할 판단
            updateUserRole()

            // 조회수 증가
            if !viewCountUpdated {
                await incrementViewCount()
                viewCountUpdated = true
            }

            // 좋아요 상태 확인
            checkIfLiked()

            // 자동 마감 체크
            await checkAndAutoCloseIfNeeded()

        } catch {
            handleError(error)
        }
        isLoading = false
    }

    // 파티 정보 새로고침
    func refreshPartyDetail() async {
        await fetchPartyDetail()
    }

    // MARK: - Party Host Action
    // 대기 멤버 수락
    func acceptWaitingMember(_ user: User) async {
        guard isHost, var party = party else { return }

        do {
            party.waitingMembers.removeAll { $0.id == user.id }
            party.member.append(user)

            try await firestoreManager.update(party)
            self.party = party

            await checkAndAutoCloseIfNeeded()
        } catch {
            handleError(error)
        }
    }

    // 대기 멤버 거절
    func rejectWaitingMember(_ user: User) async {
        guard isHost, var party = party else { return }

        do {
            party.waitingMembers.removeAll { $0.id == user.id }

            try await firestoreManager.update(party)
            self.party = party

        } catch {
            handleError(error)
        }
    }

    // 멤버 내보내기
    func removeMember(_ user: User) async {
        guard isHost, var party = party else { return }

        do {
            party.member.removeAll { $0.id == user.id }

            try await firestoreManager.update(party)
            self.party = party

        } catch {
            handleError(error)
        }
    }

    // 파티 상태 변경
    func updatePartyStatus() async {
        guard isHost, var party = party else { return }

        do {
            switch party.status {
            case .recruiting:
                party.status = .inProgress
            case .inProgress:
                party.status = .completed
            case .completed:
                break
            }

            try await firestoreManager.update(party)
            self.party = party

        } catch {
            handleError(error)
        }

    }

    // MARK: - Party Member Action
    // 파티 탈퇴
    func leaveParty() async {
        guard isParticipant, var party = party else { return }

        do {
            let currentUser = getCurrentUser()

            party.member.removeAll { $0.id == currentUser.id }

            try await firestoreManager.update(party)
            self.party = party

            updateUserRole()

        } catch {
            handleError(error)
        }
    }

    // MARK: - Common User Action
    // 파티 참여 신청
    func applyToParty() async {
        guard var party = party else { return }

        if isParticipant || isWaitingMember { return }

        if isRecruitmentComplete {
            handleError(PartyDetailError.recruitmentFull)
            return
        }

        do {
            let currentUser = getCurrentUser()

            party.waitingMembers.append(currentUser)

            try await firestoreManager.update(party)
            self.party = party

            updateUserRole()

        } catch {
            handleError(error)
        }
    }

    /// 파티 참여 신청 취소
    func cancelPartyApplication() async {
        guard isWaitingMember, var party = party else { return }

        do {
            let currentUser = getCurrentUser()

            party.waitingMembers.removeAll { $0.id == currentUser.id }

            try await firestoreManager.update(party)
            self.party = party

            updateUserRole()

        } catch {
            handleError(error)
        }
    }

    /// 댓글 작성
    func addComment(content: String) async {
        guard var party = party else { return }

        let trimmedContent = content.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        guard !trimmedContent.isEmpty else { return }

        do {
            let currentUser = getCurrentUser()
            let comment = PartyComment(
                user: currentUser,
                content: trimmedContent
            )
            party.comments.append(comment)
            
            try await firestoreManager.update(party)
            self.party = party

        } catch {
            handleError(error)
        }
    }

    /// 좋아요 토글
    func toggleLike() async {
        guard party != nil else { return }
        do {
            isLiked.toggle()
            await updateLikeCount(increment: isLiked)

            // TODO: 사용자의 좋아요 목록에도 추가/제거 해야함

        } catch {
            handleError(error)
            isLiked.toggle()  // 실패시 원상복구
        }
    }

    /// 주요 액션 버튼 클릭 처리
    func handleMainActionButton() async {
        switch currentUserRole {
        case .host:
            await updatePartyStatus()
        case .member:
            await leaveParty()
        case .waitingMember:
            await cancelPartyApplication()
        case .guest:
            if !isRecruitmentComplete {
                await applyToParty()
            }
        }
    }

    // MARK: - Private Methods
    private func setupObservers() {
        // 에러 메시지 자동 숨김
        $showError
            .filter { $0 }
            .delay(for: .seconds(3), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.showError = false
                self?.errorMessage = nil
            }
            .store(in: &cancellables)
    }

    private func updateUserRole() {
        guard let party = party else {
            currentUserRole = .guest
            return
        }

        let currentUserID = getCurrentUserID()

        if party.writen.id == currentUserID {
            currentUserRole = .host
        } else if party.member.contains(where: { $0.id == currentUserID }) {
            currentUserRole = .member
        } else if party.waitingMembers.contains(where: {
            $0.id == currentUserID
        }) {
            currentUserRole = .waitingMember
        } else {
            currentUserRole = .guest
        }
    }

    // 자동 마감 체크 및 실행
    private func checkAndAutoCloseIfNeeded() async {
        guard var party = party,
            party.status == .recruiting,
            party.member.count >= party.recruitmentCount
        else { return }

        do {
            party.status = .inProgress

            try await firestoreManager.update(party)
            self.party = party
            
        } catch {
            print("자동 마감 실패: \(error)")
        }
    }

    private func checkIfLiked() {
        isLiked = false
    }

    private func getCurrentUser() -> User {
        // TODO: 실제 로그인한 사용자 정보 반환하도록 구현
        return User.sampleCurrentUser
    }

    private func getCurrentUserID() -> UUID {
        return getCurrentUser().id
    }

    private func incrementViewCount() async {
        guard let party = party else { return }

        do {
            try await firestoreManager.updateFieldByOne(
                party,
                field: "viewCount",
                increase: true
            )

            if var updatedParty = self.party {
                updatedParty.viewCount += 1
                self.party = updatedParty
            }
        } catch {
            print("조회수 업데이트 실패\(error)")
        }
    }

    private func updateLikeCount(increment: Bool) async {
        guard let party = party else { return }

        do {
            try await firestoreManager.updateFieldByOne(
                party,
                field: "likeCount",
                increase: increment
            )

            if var updatedParty = self.party {
                updatedParty.likeCount += increment ? 1 : -1
                self.party = updatedParty
            }
        } catch {
            print("좋아요 업데이트 실패\(error)")
        }
    }

    private func handleError(_ error: Error) {
        if let partyError = error as? PartyDetailError {
            errorMessage = partyError.localizedDescription
        } else {
            errorMessage = error.localizedDescription
        }
        showError = true
    }

    // MARK: - PartyDetailError
    enum PartyDetailError: LocalizedError {
        case partyNotFound
        case notAuthorized
        case recruitmentFull
        case alreadyJoined
        case networkError

        var errorDescription: String? {
            switch self {
            case .partyNotFound:
                return "파티를 찾을 수 없습니다."
            case .notAuthorized:
                return "권한이 없습니다."
            case .recruitmentFull:
                return "모집이 완료되었습니다."
            case .alreadyJoined:
                return "이미 참여한 파티입니다."
            case .networkError:
                return "네트워크 오류가 발생했습니다."
            }
        }
    }
}
