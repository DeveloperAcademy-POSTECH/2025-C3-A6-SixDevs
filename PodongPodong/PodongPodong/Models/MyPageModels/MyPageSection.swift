//
//  MyPageSection.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/9/25.
//

import Foundation

enum MyPageSection: String, CaseIterable {
    case information = "내 활동"
    case settings = "설정"
    case account = "계정"
    
    var items: [MyPageItem] {
        switch self {
        case .information:
            return [
                .receivedReviews,
                .joinedParties,
                .favoriteParties
            ]
        case .settings:
            return [
                .notificationSettings,
                .keywordRegistration
            ]
        case .account:
            return [
                .logout,
                .withdrawal
            ]
        }
    }
}
