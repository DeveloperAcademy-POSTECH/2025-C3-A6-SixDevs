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

                    if viewModel.isLoading {
                        Spacer()
                        ProgressView("로딩 중...")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        Spacer()
                    } else if let errorMessage = viewModel.errorMessage {
                        Spacer()
                        VStack(spacing: 16) {
                            Image(systemName: errorMessage.contains("로그인") ? "person.fill.xmark" : "exclamationmark.triangle")
                                .font(.system(size: 48))
                                .foregroundColor(.gray)
                            
                            Text(errorMessage.contains("로그인") ? "로그인이 필요합니다" : "오류가 발생했습니다")
                                .font(.pretend(type: .semibold, size: 16))
                            
                            Text(errorMessage)
                                .font(.pretend(type: .regular, size: 14))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        Spacer()
                    } else {
                        MyPartiesMainView(
                            selectedTab: $viewModel.selectedPartyStatus,
                            myParties: viewModel.myParties,
                            refresh: viewModel.refreshMyParties
                        )
                    }
                }
            }
        }
        .onAppear {
            // 뷰가 나타날 때 사용자 정보를 다시 확인하고 필요시 데이터 갱신
            viewModel.reloadUserAndRefresh()
        }
    }
}

#Preview {
    MyPartiesView()
}
