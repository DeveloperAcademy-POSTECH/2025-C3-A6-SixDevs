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
        
        var body: some View {
            TabView(selection: $selectedTab) {
                ForEach(OrderType.allCases) { tab in
                    List {
                        ForEach(parties) { party in

                            PartyListItem(party: party)
                                .listRowSeparator(.hidden)
                                .listRowInsets(.init(top: 15, leading: 15,
                                                     bottom: 0, trailing:15))
                                          
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
                            .listRowInsets(.init(top: 15,
                                                 leading: 15,
                                                 bottom: 0,
                                                 trailing: 15))

                        }
                    }
                    .listStyle(PlainListStyle())
                    .tag(tab)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

#Preview {
    PartyListView()
}
