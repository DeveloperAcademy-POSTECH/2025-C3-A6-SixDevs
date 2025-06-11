//
//  MyPartiesHeaderView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/11/25.
//

import SwiftUI

extension MyPartiesView {
    struct MyPartiesTabHeader: View {
        @Binding var selectedTab: PartyStatus

        var body: some View {
            GeometryReader { geo in
                let totalWidth = geo.size.width
                let tabCount = CGFloat(PartyStatus.allCases.count)
                let indicatorWidth = totalWidth / tabCount

                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(PartyStatus.allCases, id: \.self) { tab in
                            Button {
                                withAnimation(.easeInOut) {
                                    selectedTab = tab
                                }
                            } label: {
                                Text(tab.displayName)
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
                        .offset(
                            x: indicatorWidth * CGFloat(selectedTab.rawValue)
                        )
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

#Preview {
    MyPartiesView()
}
