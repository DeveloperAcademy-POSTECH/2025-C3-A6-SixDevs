//
//  NavigationDestination.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

enum NavigationDestination: Hashable, Identifiable {
      case login
//    case home
//    case chat
    
    var id: Self { self }
    
}
