//
//  ChatListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI
import SendbirdSwiftUI

struct ChatListView: View {
    @StateObject var provider = GroupChannelListViewProvider()
    
    var body: some View {
        GroupChannelListView(provider: provider)
    }
}

#Preview {
    ChatListView()
}
