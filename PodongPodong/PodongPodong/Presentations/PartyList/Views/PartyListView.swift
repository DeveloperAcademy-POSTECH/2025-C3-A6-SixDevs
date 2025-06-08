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
                    ForEach(OrderType.allCases) { tab in
                        List {
                            ForEach(viewModel.currentParties) { party in
                                PartyListItem(party: party)
                                    .listRowSeparator(.hidden)
                                    .padding(.vertical, 4)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .tag(tab)
                    }
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
