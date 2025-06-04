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
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.chatListVM) var chatListVM: ChatListViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            GroupChannelListView(provider: chatListVM.getProvider()) // 데이터 트리거 용도
                .frame(width: 0, height: 0)
                .hidden()
            List(chatListVM.filteredChannels, id: \.channelURL) { channel in
                if let lastMessage = channel.lastMessage as? UserMessage {
                    let memberCount = channel.memberCount
                    let message = lastMessage.message
                    let date = Date(timeIntervalSince1970: TimeInterval(lastMessage.createdAt) / 1000)
                    let unreadMessageCount = Int(channel.unreadMessageCount)
                    ChatListItem(
                        title: channel.name,
                        memberCount: Int(memberCount),
                        profileImage: "", // TODO: Assets 이미지로 교체하기
                        lastMessage: message,
                        lastMessageDate: date,
                        unreadMessageCount: unreadMessageCount
                    )
                    .onTapGesture {
                        router.push(to: .chatView(channelURL: channel.channelURL))
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ChatListView()
        .environmentObject(NavigationRouter())
        .environment(ChatListViewModel(userId: "rlawlsgur716"))
}
