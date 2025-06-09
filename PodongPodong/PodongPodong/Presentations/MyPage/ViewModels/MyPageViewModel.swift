//
//  ViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/9/25.
//

import Foundation
import FirebaseAuth

enum MyPageAlertType {
    case signOut, withdrawal
}

@Observable
final class MyPageViewModel {
    var sections: [MyPageSection] = MyPageSection.allCases
    
    var userInfo: User?
    
    var alertType: MyPageAlertType? = nil
    
    var isComplete = false // 로그아웃
    var isCompleteWithdrawal = false // 회원탈퇴
    
    // MARK: - 프리뷰에서는 loadUserInfo()이 안되도록 설정
    init() {
        #if DEBUG
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" {
                loadUserInfo()
            }
        #else
            loadUserInfo()
        #endif
    }
    
    // MARK: - 유저 데이터 불러오기
    private func loadUserInfo() {
        Task {
            do {
                if let userInfo: User = try await FirestoreManager.shared.getUserInfo(
                    FirebaseAuthManager.shared.currentEmail,
                    collectionType: .user
                ) {
                    print("현재 로그인 유저 : \(userInfo)")
                    self.userInfo = userInfo
                } else {
                    print("유저를 찾을 수 없음 ")
                }
            } catch {
                print("Error : \(error.localizedDescription)")
            }
        }
    }
    
    func handleAction(item: MyPageItem) {
        switch item {
        case .receivedReviews:
            print("내가 받은 후기 이동")
        case .joinedParties:
            print("참여한 파티 이동")
        case .favoriteParties:
            print("관심 파티 목록 이동")
        case .notificationSettings:
            print("알림 설정 이동")
        case .keywordRegistration:
            print("키워드 등록 이동")
        case .logout:
            print("로그아웃")
            alertType = .signOut
        case .withdrawal:
            alertType = .withdrawal
        }
    }
    
    // MARK: - 로그아웃
    func currentUserSignOut() {
        Task {
            do {
                try await FirebaseAuthManager.shared.currentUserSignOut() // 파이어베이스 로그아웃
                KeychainManager.shared.delete(account: KeychainAccount.userID.rawValue, service: Bundle.identifier) // 키체인 정보 제거
                
                self.isComplete = true
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
        
    }
    
    // MARK: - 회원 탈퇴
    func currentUserWithdrawal() {
        self.isCompleteWithdrawal = true
    }
    
}
