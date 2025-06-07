//
//  NavigationRouter.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

final class AuthNavigationRouter: ObservableObject {
    @Published var destination: [AuthNavigationDestination] = []
    
    func push(to view: AuthNavigationDestination) {
        self.destination.append(view)
    }
    
    func pop() {
        _ = destination.popLast()
    }
    
    func popToRootView() {
        destination = []
    }
}


final class MainNavigationRouter: ObservableObject, MainNavigationRoutable {
    @Published var destination: [MainNavigationDestination] = []
    
    func push(to view: MainNavigationDestination) {
        self.destination.append(view)
    }
    
    func pop() {
        _ = destination.popLast()
    }
    
    func popToRootView() {
        destination = []
    }
}
