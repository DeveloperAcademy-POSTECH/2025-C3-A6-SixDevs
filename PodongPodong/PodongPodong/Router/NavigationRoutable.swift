//
//  NavigationRoutable.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation

protocol NavigationRoutable {
    var destination: [NavigationDestination] { get set }

    func push(to view: NavigationDestination)
    func pop()
    func popToRootView()
}
