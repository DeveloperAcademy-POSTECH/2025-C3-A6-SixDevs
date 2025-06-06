//
//  ChatListViewModelExtension.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/4/25.
//

import SwiftUI

private struct ChatListViewModelKey: EnvironmentKey {
    static let defaultValue = ChatListViewModel(userId: "rlawlsgur716") // FIXME: - 실제 유저의 아이디로 변경하기
}

extension EnvironmentValues {
    var chatListVM: ChatListViewModel {
        get { self[ChatListViewModelKey.self] }
        set { self[ChatListViewModelKey.self] = newValue }
    }
}
