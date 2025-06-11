//
//  ChatListItem.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/3/25.
//

import SwiftUI

struct ChatListItem: View {
    let title: String
    let memberCount: Int
    let profileImage: String
    let lastMessage: String
    let lastMessageDate: Date
    let unreadMessageCount: Int
    
    var body: some View {
        HStack() {
            channelImage
            
            Spacer().frame(width: 12)
            
            titleAndContent
            
            Spacer()
            
            unreadMessageCountView
        }
    }
    
    // MARK: - 채널 이미지 View
    // FIXME: - Assets 이미지로 수정하기
    var channelImage: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(width: 50, height: 50)
            .foregroundStyle(Color.black)
    }
    
    // MARK: - 타이틀(제목 + 파티참가인원), 마지막 채팅 내용 View
    var titleAndContent: some View {
        VStack(alignment: .leading) {
            HStack(spacing: .zero) {
                Text(title)
                    .font(.pretendardBold16)
                    .foregroundStyle(Color.black)
                Spacer().frame(width: 8)
                Group {
                    Image(systemName: "person.2.fill")
                    Text("\(memberCount)")
                }
                .font(.pretendardSemibold14)
                .foregroundStyle(Color.gray80)
            }
            Spacer().frame(height: 4)
            Text(lastMessage)
                .font(.pretendardMedium14)
                .foregroundStyle(Color.gray70)
        }
    }
    
    // MARK: - 마지막 채팅 날짜 및 시간, 안읽은 메시지 개수
    var unreadMessageCountView: some View {
        VStack(spacing: .zero) {
            Text(lastMessageDate.md)
                .font(.pretendardMedium12)
                .foregroundStyle(Color.gray60)
            
            Spacer().frame(height: 15)
            
            Text("\(unreadMessageCount)")
                .font(.pretendardMedium12)
                .foregroundStyle(unreadMessageCount > 0 ? Color.white : Color.clear)
                .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                .background(
                    Capsule()
                        .fill(unreadMessageCount > 0 ? Color.red10 : Color.clear)
                )
        }
    }
    
}

#Preview(traits: .sizeThatFitsLayout) {
    ChatListItem(
        title: "냉장 삼겹살 3kg 파티원 모집",
        memberCount: 3,
        profileImage: "person.2.fill",
        lastMessage: "네네 괜찮습니다! 다른 분들도 원하시는 양이 있다면 말씀해주세요~~",
        lastMessageDate: Date(),
        unreadMessageCount: 10
    )
}
