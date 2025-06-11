//
//  PartyDetailViewModel.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/2/25.
//

/*
 MARK: - PartyDetailViewModel
 
 파일 구조
  ViewModels/
  └── PartyDetailViewModel/
      ├── PartyDetailViewModel+UseActions.swift         유저 관련
      ├── PartyDetailViewModel+HostActions.swift        파티장 기능
      ├── PartyDetailViewModel+DataFetching.swift       파티 정보 조회 및 갱신
      ├── PartyDetailViewModel+ViewConfigration.swift   뷰 상태 및 뷰 전용 프로퍼티
      └── PartyDetailViewModel+Helpers.swift            공통 유틸 함수
*/

import Combine
import Foundation
import SwiftUI

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
    @Published var showingActionAlert: Bool = false
    // TODO: - 유저 받아오기
    @Published var user: User = DummyData.user

    // MARK: - Internal Properties
    let firestoreManager = FirestoreManager.shared
    let partyID: String
    var viewCountUpdated = false

    // MARK: - Private 프로퍼티
    private var cancellables = Set<AnyCancellable>()

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

        var buttonTitle: String {
            switch self {
            case .host:
                return "파티 마감하기"
            case .member:
                return "참여중"
            case .waitingMember:
                return "참여 신청중"
            case .guest:
                return "파티 참여하기"
            }
        }

        var isActionEnabled: Bool {
            switch self {
            case .host, .waitingMember, .guest:
                return true
            case .member:
                return false
            }
        }
    }
    
    // MARK: - Setup
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

    // MARK: - Error Handling
    func handleError(_ error: Error) {
        if let partyError = error as? PartyDetailError {
            errorMessage = partyError.localizedDescription
        } else {
            errorMessage = error.localizedDescription
        }
        showError = true
    }
    
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
