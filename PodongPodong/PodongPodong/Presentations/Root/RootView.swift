//
//  RootView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/2/25.
//

import SwiftUI
import SendbirdSwiftUI

struct RootView: View {
    @StateObject var router: MainNavigationRouter = .init()
    
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
                    MyPageView()
                        
                }
            }
            .environmentObject(router)
            .navigationDestination(for: MainNavigationDestination.self) { route in
                switch route {
                case .chatView(let channelURL):
                    ChatView(provider: GroupChannelViewProvider(channelURL: channelURL))
                case .updateProfileView:
                    UpdateProfileView()
                        .environmentObject(router)
                        .hideBackButton()
                case .myReviewView:
                    MyReviewView()
                        .environmentObject(router)
                        .hideBackButton()
                case .participatedView:
                    ParticipatedView()
                        .environmentObject(router)
                        .hideBackButton()
                case .interestedPartiesView:
                    InterestedPartiesView()
                        .environmentObject(router)
                        .hideBackButton()
                case .alarmSettingView:
                    AlarmSettingView()
                        .environmentObject(router)
                        .hideBackButton()
                case .keywordRegistrationView:
                    KeywordRegistrationView()
                        .environmentObject(router)
                        .hideBackButton()
                }
            }
            .tint(Color.black)
        }
    }
}


#Preview {
    RootView()
}
