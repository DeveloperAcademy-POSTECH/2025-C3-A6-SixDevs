//
//  RootView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/2/25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
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
    }
}

#Preview {
    RootView()
}
