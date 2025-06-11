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
    @EnvironmentObject var router: MainNavigationRouter
    @Environment(\.chatListVM) var chatListVM: ChatListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            hiddenView
            
            navigationTitle
            
            chatListView
        }
    }
    
    // MARK: - 데이터 트리거 용도 뷰 (보이지는 않음)
    var hiddenView: some View {
        GroupChannelListView(provider: chatListVM.getProvider()) // 데이터 트리거 용도
            .frame(width: 0, height: 0)
            .hidden()
    }
    
    // MARK: - 커스텀 네비게이션 타이틀
    var navigationTitle: some View {
        Text("채팅 목록")
            .font(.pretendardSemibold24)
            .foregroundStyle(Color.secondary)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
    }
    
    // MARK: - 채팅 리스트 뷰
    var chatListView: some View {
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

#Preview {
    ChatListView()
        .environmentObject(MainNavigationRouter())
        .environment(ChatListViewModel(userId: "rlawlsgur7"))
}
