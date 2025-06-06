//
//  NavigationRouter.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

@Observable
class NavigationRouter: ObservableObject, NavigationRoutable {
    var destination: [NavigationDestination] = []
    
    func push(to view: NavigationDestination) {
        self.destination.append(view)
    }
    
    func pop() {
        _ = destination.popLast()
    }
    
    func popToRootView() {
        destination = []
    }
}
