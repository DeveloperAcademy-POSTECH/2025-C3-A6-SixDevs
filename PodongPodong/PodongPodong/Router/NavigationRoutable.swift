//
//  NavigationRoutable.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation

protocol AuthNavigationRoutable {
    var destination: [AuthNavigationDestination] { get set }

    func push(to view: AuthNavigationDestination)
    func pop()
    func popToRootView()
}

protocol MainNavigationRoutable {
    var destination: [MainNavigationDestination] { get set }

    func push(to view: MainNavigationDestination)
    func pop()
    func popToRootView()
}
