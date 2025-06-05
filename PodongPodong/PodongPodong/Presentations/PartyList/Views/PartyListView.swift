//
//  PartyListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct PartyListView: View {
    @State private var viewModel = PartyListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                PartyListTabHeader(
                    selectedTab: $viewModel.selectedTab
                )
                .frame(height: 47)
                .overlay(Divider(), alignment: .bottom)
                
                TabView(selection: $viewModel.selectedTab) {
                    VStack {
                        Spacer()
                        Text("공동구매 콘텐츠")
                            .font(.pretendardMedium18)
                        Spacer()
                    }
                    .tag(PartyListTab.공동구매)
                    
                    VStack {
                        Spacer()
                        Text("장보기 콘텐츠")
                            .font(.pretendardMedium18)
                        Spacer()
                    }
                    .tag(PartyListTab.장보기)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationBarItems(
                leading: PartyListNavBarTitle(),
                trailing: PartyListNavBarButtons(
                    searchButtonAction: {},
                    bellButtonAction: {}
                )
            )
        }
    }
}

#Preview {
    PartyListView()
}
