//
//  MyPartiesView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct MyPartiesView: View {
    @State private var viewModel = MyPartiesViewModel()

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.clear.ignoresSafeArea()

                VStack {
                    Text("내가 참여한 파티")
                        .font(.pretend(type: .bold, size: 18))

                    MyPartiesTabHeader(
                        selectedTab: $viewModel.selectedPartyStatus
                    )
                    .frame(height: 47)
                    .overlay(Divider(), alignment: .bottom)

                    MyPartiesMainView(
                        selectedTab: $viewModel.selectedPartyStatus,
                        myParties: viewModel.myParties
                    )
                }
            }
        }
    }
}

#Preview {
    MyPartiesView()
}
