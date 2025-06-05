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
        GroupChannelView(provider: provider)
    }
}

#Preview {
    ChatView(
        provider: GroupChannelViewProvider(
            channelURL: Bundle.main.testChannel
        )
    )
}
