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
        let refresh: () -> Void

        var body: some View {
            TabView(selection: $selectedTab) {
                ForEach(PartyStatus.allCases) { tab in
                    Group {
                        if filteredParties(for: tab).isEmpty {
                            // 빈 상태 표시
                            VStack(spacing: 16) {
                                Image(systemName: "person.2.slash")
                                    .font(.system(size: 48))
                                    .foregroundColor(.gray)
                                Text("참여한 파티가 없습니다")
                                    .font(.pretend(type: .medium, size: 16))
                                    .foregroundColor(.gray)
                                Button("새로고침") {
                                    refresh()
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } else {
                            List {
                                ForEach(filteredParties(for: tab)) { party in
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
                            .refreshable {
                                refresh()
                            }
                        }
                    }
                    .tag(tab)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        // 특정 탭에 해당하는 파티들을 필터링
        private func filteredParties(for status: PartyStatus) -> [Party] {
            return myParties.filter { $0.status == status }
        }
    }
}

#Preview {
    MyPartiesView()
}
