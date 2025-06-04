//
//  ChatView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/4/25.
//

import SwiftUI
import SendbirdSwiftUI

struct ChatView: View {
    @ObservedObject var provider: GroupChannelViewProvider
    
    var body: some View {
        GroupChannelView(
            provider: provider,
            headerItem: {
                .init()
                .leftView { viewConfig in
                    Image(systemName: "chevron.left")
                }
                .titleView(content: { viewConfig in
                    Text(provider.channel?.name ?? "")
                        .font(.pretendardBold18)
                        .foregroundStyle(Color.black)
                })
                .rightView { viewConfig in // Use chaining.
                    Image(systemName: "line.3.horizontal")
                }
            })
    }
}

#Preview {
    ChatView(
        provider: GroupChannelViewProvider(
            channelURL: Bundle.main.testChannel
        )
    )
}
