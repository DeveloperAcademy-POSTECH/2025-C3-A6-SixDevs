//
//  ChatListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI
import SendbirdSwiftUI
import SendbirdChatSDK

struct ChatListView: View {
    private var chatListVM = ChatListViewModel(userId: "rlawlsgur716")
    
    var body: some View {
        NavigationStack { // FIXME: - 임시 스택
            VStack(spacing: 0) {
                GroupChannelListView(provider: chatListVM.getProvider()) // 데이터 트리거 용도
                    .frame(width: 0, height: 0)
                    .hidden()
                List(chatListVM.filteredChannels, id: \.channelURL) { channel in
                    if let lastMessage = channel.lastMessage as? UserMessage {
                        let memberCount = channel.memberCount
                        let message = lastMessage.message
                        let date = Date(timeIntervalSince1970: TimeInterval(lastMessage.createdAt) / 1000)
                        let unreadMessageCount = Int(channel.unreadMessageCount)
                        NavigationLink(
                            value: channel.channelURL
                        ) {
                            ChatListItem(
                                title: channel.name,
                                memberCount: Int(memberCount),
                                profileImage: "", // TODO: Assets 이미지로 교체하기
                                lastMessage: message,
                                lastMessageDate: date,
                                unreadMessageCount: unreadMessageCount
                            )
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("채팅 목록")
            .navigationDestination(for: String.self) { channelURL in
                ChatView(provider: GroupChannelViewProvider(channelURL: channelURL))
            }
        }
    }
}

#Preview {
    ChatListView()
}
