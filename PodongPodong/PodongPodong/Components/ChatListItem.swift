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
        HStack {
            Image(systemName: profileImage)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(title).bold()
                    Text("\(memberCount)")
                        .font(.caption)
                }
                Text(lastMessage)
            }
            
            Spacer()
            
            VStack {
                Spacer()
                
                Text(lastMessageDate.mmdd)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                if unreadMessageCount == 0 {
                    
                } else {
                    Text("\(unreadMessageCount)")
                }
                
                Spacer()
            } //: VSTACK
        }
    }
}

#Preview {
    ChatListItem(title: "rlawlsgur716 파티", memberCount: 3, profileImage: "person.circle.fill", lastMessage: "ㅊㅊㅊㅊㅊ", lastMessageDate: Date(), unreadMessageCount: 2)
}
