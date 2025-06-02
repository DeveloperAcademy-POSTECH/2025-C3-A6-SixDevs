//
//  NavigationRouter.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

class NavigationRouter: ObservableObject, NavigationRoutable {
    @Published var destination: [NavigationDestination] = []
    
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
