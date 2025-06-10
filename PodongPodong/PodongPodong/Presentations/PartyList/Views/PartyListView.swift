//
//  PartyListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct PartyListView: View {
    @EnvironmentObject var router: MainNavigationRouter
    @State private var viewModel = PartyListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    
                    PartyListTabHeader(
                        selectedTab: $viewModel.selectedOrderType
                    )
                    .frame(height: 47)
                    .overlay(Divider(), alignment: .bottom)

                    PartyListFoodCategoryView(
                        selectedFoodCategory: $viewModel.selectedFoodCategory
                    )
                    
                    PartyListMainView(
                        selectedTab: $viewModel.selectedOrderType,
                        parties: viewModel.currentParties
                    )
                }
                .navigationBarItems(
                    leading: PartyListNavBarTitle(),
                    trailing: PartyListNavBarButtons(
                        searchButtonAction: {},
                        bellButtonAction: {},
                        //TODO: 내비게이션
//                        searchButtonAction: { router.push(to: .searchView) },
//                        bellButtonAction: { router.push(to: .notification) },
                    )
                )
                
                // TODO: 생성 화면으로 이동
                NavigationLink {
                    PartyCreateView()
                        .navigationBarBackButtonHidden()
                } label : {
                    PlusFloatingView(size: 56)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 22)
                .padding(.bottom, 16)
            }

        }
    }
}

#Preview {
    PartyListView()
}
