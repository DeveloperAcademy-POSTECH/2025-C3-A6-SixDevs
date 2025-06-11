//
//  MyPartiesMainView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/11/25.
//

import SwiftUI

extension MyPartiesView {
    struct MyPartiesMainView: View {
        @Binding var selectedTab: PartyStatus
        let myParties: [Party]

        var body: some View {
            TabView(selection: $selectedTab) {
                ForEach(PartyStatus.allCases) { tab in
                    List {
                        ForEach(myParties) { party in

                            PartyListItem(party: party)
                                .listRowSeparator(.hidden)
                                .listRowInsets(
                                    .init(
                                        top: 15,
                                        leading: 15,
                                        bottom: 0,
                                        trailing: 15
                                    )
                                )

                            ZStack {
                                NavigationLink {
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
                            .listRowInsets(
                                .init(
                                    top: 15,
                                    leading: 15,
                                    bottom: 0,
                                    trailing: 15
                                )
                            )

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
    MyPartiesView()
}
