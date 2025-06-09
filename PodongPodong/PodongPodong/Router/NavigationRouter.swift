//
//  NavigationRouter.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI


final class NavigationRouter<T: NavigationDestination>: ObservableObject, NavigationRoutable {
    @Published var destination: [T] = []

    func push(to view: T) {
        destination.append(view)
    }

    func pop() {
        _ = destination.popLast()
    }

    func popToRootView() {
        destination = []
    }
}

typealias AuthNavigationRouter = NavigationRouter<AuthNavigationDestination>
typealias MainNavigationRouter = NavigationRouter<MainNavigationDestination>
