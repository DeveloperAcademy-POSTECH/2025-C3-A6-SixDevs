//
//  SearchView.swift
//  PodongPodong
//
//  Created by Paidion on 6/4/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var filterContentHeight: CGFloat = 250
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // 1. 상단 검색바 (내비게이션, 검색 텍스트필드)
                SearchHeaderView(text: $viewModel.searchText)
                    .focused($isTextFieldFocused)
                
                // 2. 공동 구매 / 장보기 (탭버튼)
                SearchTabHeader(
                    selectedTab: $viewModel.selectedTab,
                    purchaseChannel: $viewModel.purchaseChannel
                )
                .frame(height: 47)
                .overlay(Divider(), alignment: .bottom)
                
                // 3. (모집중-진행중만 보기 / 필터 버튼)
                SearchList_FilterHeader(
                    isShowingNotCompletedPartyOnly: $viewModel.isShowingNotCompletedPartyOnly,
                    isFilterApplied: viewModel.isFilterApplied) {
                        viewModel.isShowingNotCompletedPartyOnly ?
                        (viewModel.isShowingNotCompletedPartyOnly = false) :
                        (viewModel.isShowingNotCompletedPartyOnly = true)
                    } filterButtonAction: {
                        viewModel.isShowingFilterView ?
                        (viewModel.isShowingFilterView = false) :
                        (viewModel.isShowingFilterView = true)
                    }
                
                // 4. 검색 목록
                TabView(selection: $viewModel.selectedTab) {
                    VStack {
                        Spacer()
                        
                        VStack(spacing: 10) {
                            Text("공동구매 콘텐츠")
                                .font(.pretendardMedium18)
                            Text("검색어: \(viewModel.searchText)")
                            Text("모집중 - 진행중인 파티: \(viewModel.isShowingNotCompletedPartyOnly)")
                            Text("카테고리: \(viewModel.foodCategory)")
                            Text("구매처: \(viewModel.purchaseChannel)")
                            Text("필터링뷰: \(viewModel.isShowingFilterView)")
                        }
                        
                        Spacer()
                    }
                    .tag(PartyListTab.공동구매)
                    
                    VStack {
                        Spacer()
                        Text("장보기 콘텐츠")
                            .font(.pretendardMedium18)
                        Text("검색어: \(viewModel.searchText)")
                        Text("모집중 - 진행중인 파티: \(viewModel.isShowingNotCompletedPartyOnly)")
                        Text("카테고리: \(viewModel.foodCategory)")
                        Text("구매처: \(viewModel.purchaseChannel)")
                        Text("필터링뷰: \(viewModel.isShowingFilterView)")
                        Spacer()
                    }
                    .tag(PartyListTab.장보기)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            // 5. 필터 바텀 시트
            .sheet(isPresented: $viewModel.isShowingFilterView) {
                SearchFilterView(viewModel: viewModel, initialFoodCategory: viewModel.foodCategory,
                                 initialPurchaseChannel: viewModel.purchaseChannel,                            contentHeight: $filterContentHeight)
                .presentationDetents([.height(filterContentHeight)])
                .presentationDragIndicator(.visible)
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
        
}



#Preview {
    NavigationStack {
        SearchView()
    }
}
