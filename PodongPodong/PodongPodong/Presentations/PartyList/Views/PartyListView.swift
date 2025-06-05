//
//  PartyListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct PartyListView: View {
    @State private var viewModel = PartyListViewModel()
    @State private var selectedTab: Tab = .공동구매

    enum Tab: Int, CaseIterable, Identifiable {
        case 공동구매 = 0, 장보기
        var id: Int { rawValue }
        var title: String {
            switch self {
            case .공동구매: return "공동구매"
            case .장보기:   return "장보기"
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                GeometryReader { geo in
                    let totalWidth = geo.size.width
                    let tabCount = CGFloat(Tab.allCases.count)
                    let indicatorWidth = totalWidth / tabCount

                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            ForEach(Tab.allCases) { tab in
                                Button {
                                    withAnimation(.easeInOut) {
                                        selectedTab = tab
                                    }
                                } label: {
                                    Text(tab.title)
                                        .font(
                                            selectedTab == tab
                                            ? .pretendardBold18
                                            : .pretendardMedium18
                                        )
                                        .foregroundColor(
                                            selectedTab == tab
                                            ? Color.secondary
                                            : Color.gray40
                                        )
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 44)
                                }
                            }
                        }
                        .frame(width: totalWidth)
                        .background(Color.white)

                        Rectangle()
                            .fill(Color.secondary)
                            .frame(width: indicatorWidth, height: 3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: indicatorWidth * CGFloat(selectedTab.rawValue))
                            .animation(.easeInOut, value: selectedTab)
                    }
                    .frame(width: totalWidth, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 47)
                .overlay(Divider(), alignment: .bottom)

                // PageTabViewStyle을 이용한 TabView
                TabView(selection: $selectedTab) {
                    VStack {
                        Spacer()
                        Text("공동구매 콘텐츠")
                            .font(.pretendardMedium18)
                        Spacer()
                    }
                    .tag(Tab.공동구매)

                    VStack {
                        Spacer()
                        Text("장보기 콘텐츠")
                            .font(.pretendardMedium18)
                        Spacer()
                    }
                    .tag(Tab.장보기)
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

// MARK: - navigationBar View Items

extension PartyListView {
    struct PartyListNavBarTitle: View {
        var body: some View {
            Text("포동포동")
                .font(.pretendardSemibold24)
                .foregroundColor(.primaryColor)
        }
    }

    struct PartyListNavBarButtons: View {
        let searchButtonAction: () -> Void
        let bellButtonAction: () -> Void

        var body: some View {
            HStack(spacing: 16) {
                Button(action: searchButtonAction) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
                Button(action: bellButtonAction) {
                    Image(systemName: "bell")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

#Preview {
    PartyListView()
}
