//
//  PartyList+HeaderView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/5/25.
//

import SwiftUI

extension PartyListView {
    struct PartyListTabHeader: View {
        @Binding var selectedTab: OrderType
        
        var body: some View {
            GeometryReader { geo in
                let totalWidth = geo.size.width
                let tabCount = CGFloat(OrderType.allCases.count)
                let indicatorWidth = totalWidth / tabCount
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(OrderType.allCases) { tab in
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
        }
    }
}
