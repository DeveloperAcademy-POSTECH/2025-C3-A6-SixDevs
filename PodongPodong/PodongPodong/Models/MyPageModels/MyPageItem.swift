//
//  MyPageItem.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/9/25.
//

import Foundation

enum MyPageItem: Hashable {
    // 내 활동
    case receivedReviews
    case joinedParties
    case favoriteParties
    
    // 설정
    case notificationSettings
    case keywordRegistration
    
    // 계정
    case logout
    case withdrawal
    
    var title: String {
        switch self {
        case .receivedReviews: return "내가 받은 후기"
        case .joinedParties: return "참여한 파티"
        case .favoriteParties: return "관심 파티 목록"
        case .notificationSettings: return "알림 설정"
        case .keywordRegistration: return "키워드 등록"
        case .logout: return "로그아웃"
        case .withdrawal: return "회원 탈퇴"
        }
    }
}
