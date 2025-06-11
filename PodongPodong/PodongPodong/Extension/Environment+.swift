//
//  Environment+.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/4/25.
//

import SwiftUI

// MARK: - ChatViewModel
private struct ChatListViewModelKey: EnvironmentKey {
    static let defaultValue = ChatListViewModel(userId: "rlawlsgur716") // FIXME: - 수정해야함
}

// MARK: - MyPageViewModel
private struct MyPageViewModelKey: EnvironmentKey {
    static let defaultValue = MyPageViewModel()
}


extension EnvironmentValues {
    var chatListVM: ChatListViewModel {
        get { self[ChatListViewModelKey.self] }
        set { self[ChatListViewModelKey.self] = newValue }
    }
    
    var myPageVM: MyPageViewModel {
        get { self[MyPageViewModelKey.self] }
        set { self[MyPageViewModelKey.self] = newValue }
    }
}
