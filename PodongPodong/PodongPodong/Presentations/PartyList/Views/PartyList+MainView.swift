//
//  PartyList+MainView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/8/25.
//

import SwiftUI

extension PartyListView {
    struct PartyListMainView: View {
        @Binding var selectedTab: OrderType
        let parties: [Party]
        
        let refresh: () -> Void
        
        var body: some View {
            TabView(selection: $selectedTab) {
                ForEach(OrderType.allCases) { tab in
                    List {
                        ForEach(parties) { party in
                            ZStack {
                                NavigationLink {
                                    // TODO: 파티 디테일 이동
                                    PartyDetailView(party: party)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    EmptyView()
                                }
                                .opacity(0)
                                
                                PartyListItem(party: party)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 16,
                                                 leading: 16,
                                                 bottom: 0,
                                                 trailing: 16))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .tag(tab)
                    .refreshable {
                        refresh()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

#Preview {
    PartyListView()
}
