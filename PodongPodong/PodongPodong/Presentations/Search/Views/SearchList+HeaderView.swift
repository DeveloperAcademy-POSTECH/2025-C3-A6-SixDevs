//
//  PartyList+HeaderView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/5/25.
//

import SwiftUI

extension SearchView {
    struct SearchTabHeader: View {
        @Binding var selectedTab: PartyListTab
        @Binding var purchaseChannel: PurchaseChannel?
        
        var body: some View {
            GeometryReader { geo in
                let totalWidth = geo.size.width
                let tabCount = CGFloat(PartyListTab.allCases.count)
                let indicatorWidth = totalWidth / tabCount
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(PartyListTab.allCases) { tab in
                            Button {
                                guard selectedTab != tab else { return }
                                withAnimation(.easeInOut) {
                                    selectedTab = tab
                                    if tab.title == "장보기" {
                                        purchaseChannel = .offline
                                    } else {
                                        purchaseChannel = nil
                                    }
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
        }
    }
}
