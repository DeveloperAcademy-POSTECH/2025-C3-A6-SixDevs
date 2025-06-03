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
        GroupChannelListView(provider: chatListVM.getProvider()) // 데이터 트리거 역활만
            .frame(width: 0, height: 0)
            .hidden()
        
        List {
            ForEach(chatListVM.filteredChannels, id: \.channelURL) { channel in
                if let lastMessage = channel.lastMessage as? UserMessage {
                    let memberCount = channel.memberCount
                    let message = lastMessage.message
                    let date = Date(timeIntervalSince1970: TimeInterval(lastMessage.createdAt) / 1000)
                    let unreadMessageCount = Int(channel.unreadMessageCount)
                    ChatListItem(
                        title: channel.name,
                        memberCount: Int(memberCount),
                        profileImage: "person.circle.fill",
                        lastMessage: message,
                        lastMessageDate: date,
                        unreadMessageCount: unreadMessageCount
                    )
                }
            }
        }
    }
}

#Preview {
    ChatListView()
}
