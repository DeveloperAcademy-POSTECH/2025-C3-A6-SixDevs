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
    //TODO: 내비게이션
//    case searchView
//    case notification
    
    var id: Self { self }
}
