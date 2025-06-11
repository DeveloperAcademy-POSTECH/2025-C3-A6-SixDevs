//
//  NavigationDestination.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

protocol NavigationDestination: Hashable, Identifiable {}

// MARK: - Auth
enum AuthNavigationDestination: NavigationDestination {
    case emailInput
    case emailSent

    var id: Self { self }
}

// MARK: - Home
enum MainNavigationDestination: NavigationDestination {
    
    case chatView(channelURL: String)
    
    
    case updateProfileView
    case myReviewView
    case participatedView
    case interestedPartiesView
    case alarmSettingView
    case keywordRegistrationView
    
    
    var id: Self { self }
}
