//
//  MyPartiesView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct MyPartiesView: View {
//    @State private var viewModel = MyPartiesViewModel()
//    @Binding var selectedTab: PartyStatus
    
    var body: some View {
        VStack(spacing: 0) {
            Text("내가 참여한 파티")
                .font(.pretend(type: .bold, size: 18))
            
//            GeometryReader { geo in
//                let totalWidth = geo.size.width
//                let tabCount = CGFloat(OrderType.allCases.count)
//                let indicatorWidth = totalWidth / tabCount
//                
//                VStack(spacing: 0) {
//                    HStack(spacing: 0) {
//                        ForEach(OrderType.allCases) { tab in
//                            Button {
//                                withAnimation(.easeInOut) {
//                                    selectedTab = tab
//                                }
//                            } label: {
//                                Text(tab.title)
//                                    .font(
//                                        selectedTab == tab
//                                        ? .pretendardBold18
//                                        : .pretendardMedium18
//                                    )
//                                    .foregroundColor(
//                                        selectedTab == tab
//                                        ? Color.secondary
//                                        : Color.gray40
//                                    )
//                                    .frame(maxWidth: .infinity)
//                                    .frame(height: 44)
//                            }
//                        }
//                    }
//                    .frame(width: totalWidth)
//                    .background(Color.white)
//                    
//                    Rectangle()
//                        .fill(Color.secondary)
//                        .frame(width: indicatorWidth, height: 3)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .offset(x: indicatorWidth * CGFloat(selectedTab.rawValue))
//                        .animation(.easeInOut, value: selectedTab)
//                }
//                .frame(width: totalWidth, alignment: .leading)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .frame(height: 47)
//            .overlay(Divider(), alignment: .bottom)

            
            Image("내참파")
                .resizable()
 
        }
    }
    
    
    
    
}


#Preview {
    MyPartiesView()
}
