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
    
    var isComplete = false
    
    init() {
        loadUserInfo()
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
            // TODO: 로그 아웃할때 : AlertView 띄우고 - 파이어베이스 로그아웃, 키체인 유저 정보 제거하기,
            alertType = .signOut
        case .withdrawal:
            print("회원 탈퇴")
            // TODO: 로그 아웃할때 : AlertView 띄우고 - 파이어베이스 계정삭제 (Auth, FirebaseStore 데이터 삭제), 키체인 유저 정보 제거하기, Sendbird 탈퇴
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
    
}
