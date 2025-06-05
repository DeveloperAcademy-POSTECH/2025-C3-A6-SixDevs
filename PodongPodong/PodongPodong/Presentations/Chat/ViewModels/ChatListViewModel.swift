//
//  ChatListViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/3/25.
//

import Foundation
import SendbirdSwiftUI
import SendbirdChatSDK
import Combine

@Observable
final class ChatListViewModel {
    var filteredChannels: [GroupChannel] = []
    
    private var provider: GroupChannelListViewProvider
    private var cancellables = Set<AnyCancellable>()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self.provider = GroupChannelListViewProvider()
        bind()
    }
    
    func getProvider() -> GroupChannelListViewProvider {
        provider
    }
    
    private func bind() {
        provider.$channels
            .receive(on: DispatchQueue.main)
            .sink { [weak self] channels in
                guard let self else { return }
                let filtered = channels.filter { channel in
                    channel.members.contains { $0.userId == self.userId }
                }
                self.filteredChannels = filtered
                print("필터 결과 채널 수: \(filtered.count)")
            }
            .store(in: &cancellables)
    }
    
    
}
