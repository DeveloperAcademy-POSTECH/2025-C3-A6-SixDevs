//
//  NavigationDestination.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

enum AuthNavigationDestination: Hashable, Identifiable {
    case emailInput
    case emailSent

    var id: Self { self }
}

enum MainNavigationDestination: Hashable, Identifiable {
    case chatView(channelURL: String)
    
    var id: Self { self }
}
