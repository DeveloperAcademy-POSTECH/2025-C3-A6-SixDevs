//
//  PartyDetailVewModel+UserAction.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/8/25.
//

import Foundation

// MARK: - User Actions
extension PartyDetailViewModel {

    // 파티 참여 신청
    func applyToParty() async {
        guard var party = party else { return }

        if isParticipant || isWaitingMember { return }

        if party.status != .recruiting {
            handleError(PartyDetailError.recruitmentFull)
            return
        }

        do {
            let currentUser = user

            party.waitingMembers.append(currentUser)

            try await firestoreManager.update(party)
            self.party = party

            updateUserRole()

        } catch {
            handleError(error)
        }
    }

    // 파티 떠나기
    func leaveParty() async {
        guard isParticipant, var party = party else { return }

        do {
            let currentUser = user

            party.member.removeAll { $0.id == currentUser.id }

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
            let currentUser = user

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
            let currentUser = user
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
        guard let party = party else { return }
        do {
            isLiked.toggle()
            await updateLikeCount(increment: isLiked)

            // TODO: 사용자의 좋아요 목록에도 추가/제거 해야함
        } catch {
            handleError(error)
            isLiked.toggle()  // 실패시 원상복구
        }
    }

    // 메인 액션 버튼 클릭 처리 (Alert 고려)
    func handleActionButtonTap() {
        if viewConfiguration.shouldShowAlert {
            showingActionAlert = true
        } else {
            Task {
                await executeMainAction()
            }
        }
    }

    // Alert 확인 후 실제 액션 실행
    func executeMainAction() async {
        await handleMainActionButton()
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
            if party?.status == .recruiting {
                await applyToParty()
            }
        }
    }
}
