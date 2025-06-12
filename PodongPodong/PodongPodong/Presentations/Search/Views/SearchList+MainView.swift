//
//  SearchList+MainView.swift
//  PodongPodong
//
//  Created by Paidion on 6/8/25.
//

import SwiftUI

extension SearchView {
    struct SearchMainView: View {
        @Binding var selectedTab: OrderType
        @Binding var isLoading: Bool
        let parties: [Party]
        
        var body: some View {
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if parties.isEmpty {
                Text("등록된 게시물이 없습니다")
                    .font(.pretendardMedium16)
                    .foregroundStyle(Color.gray80)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
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
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
}
