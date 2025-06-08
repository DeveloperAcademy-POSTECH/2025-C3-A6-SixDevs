//
//  NavigationRoutable.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation

protocol NavigationRoutable: AnyObject {
    associatedtype Destination: NavigationDestination
    var destination: [Destination] { get set }
    func push(to view: Destination)
    func pop()
    func popToRootView()
}
