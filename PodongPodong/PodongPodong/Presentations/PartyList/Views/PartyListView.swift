//
//  PartyListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct PartyListView: View {
    @State private var viewModel = PartyListViewModel()
    
    var body: some View {
        NavigationView {
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
                    bellButtonAction: {}
                )
            )
        }
    }
}

#Preview {
    PartyListView()
}
