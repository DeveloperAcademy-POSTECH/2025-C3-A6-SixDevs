//
//  ViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/9/25.
//

import Foundation
import FirebaseAuth

@Observable
final class MyPageViewModel {
    var sections: [MyPageSection] = MyPageSection.allCases
    
    var userInfo: User?
    
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
        case .withdrawal:
            print("회원 탈퇴")
        }
    }
}
