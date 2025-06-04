//
//  RootView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/2/25.
//

import SwiftUI
import SendbirdSwiftUI

struct RootView: View {
    @State var router: NavigationRouter = .init()
    
    var body: some View {
        NavigationStack(path: $router.destination) {
            TabView {
                Tab("파티 목록", systemImage: "text.page.badge.magnifyingglass") {
                    PartyListView()
                }
                
                Tab("내 파티", systemImage: "person.2") {
                    MyPartiesView()
                }
                
                Tab("채팅", systemImage: "message") {
                    ChatListView()
                }
                
                Tab("마이", systemImage: "person") {
                    ProfileView()
                }
            }
            .environmentObject(router)
            .navigationDestination(for: NavigationDestination.self) { route in
                switch route {
                case .chatView(let channelURL):
                    ChatView(provider: GroupChannelViewProvider(channelURL: channelURL))
                }
            }
        }
        
    }
}


#Preview {
    RootView()
}
