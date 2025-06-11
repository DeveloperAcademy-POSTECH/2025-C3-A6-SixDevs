//
//  PartyListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct PartyListView: View {
    @State private var viewModel = PartyListViewModel()
    @State private var isSearchActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    
                    Spacer().frame(height: 15)
                    
                    PartyListTabHeader(
                        selectedTab: $viewModel.selectedOrderType
                    )
                    .frame(height: 30)
                    //.overlay(Divider(), alignment: .bottom)
                    
                    PartyListFoodCategoryView(
                        selectedFoodCategory: $viewModel.selectedFoodCategory
                    )
                    .padding(.top, 16)
                    
                    PartyListMainView(
                        selectedTab: $viewModel.selectedOrderType,
                        parties: viewModel.currentParties,
                        refresh: viewModel.partyListFetch
                    )
                }
                .navigationBarItems(
                    leading: PartyListNavBarTitle(),
                    trailing: PartyListNavBarButtons(
                        searchButtonAction: { isSearchActive = true },
                        bellButtonAction: {}
                    )
                )
                
                NavigationLink(
                    destination: SearchView().hideBackButton(),
                    isActive: $isSearchActive
                ) {
                    EmptyView()
                }
                
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
