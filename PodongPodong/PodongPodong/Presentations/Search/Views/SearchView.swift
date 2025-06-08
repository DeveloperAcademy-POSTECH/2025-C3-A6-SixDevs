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
            Color.clear.ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    isTextFieldFocused = false
                }

            VStack(spacing: 0) {
                // 1. 상단 검색바 (내비게이션, 검색 텍스트필드)
                SearchHeaderView(text: $viewModel.searchText)
                    .focused($isTextFieldFocused)

                // 2. 공동 구매 / 장보기 (탭버튼)
                SearchTabHeader(
                    selectedTab: $viewModel.selectedOrderType,
                    purchaseChannel: $viewModel.purchaseChannel
                )
                .frame(height: 47)
                .overlay(Divider(), alignment: .bottom)

                // 3. (모집중-진행중만 보기 / 필터 버튼)
                SearchList_FilterHeader(
                    isShowingNotCompletedPartyOnly: $viewModel
                        .isShowingNotCompletedPartyOnly,
                    isFilterApplied: viewModel.isFilterApplied
                ) {
                    viewModel.isShowingNotCompletedPartyOnly
                        ? (viewModel.isShowingNotCompletedPartyOnly = false)
                        : (viewModel.isShowingNotCompletedPartyOnly = true)
                } filterButtonAction: {
                    viewModel.isShowingFilterView
                        ? (viewModel.isShowingFilterView = false)
                        : (viewModel.isShowingFilterView = true)
                }

                // 4. 검색 목록
                if viewModel.searchText.isEmpty {
                    Spacer()
                    VStack(alignment: .center, spacing: 16) {
                        Text("검색어를 입력하여")
                        Text("원하는 파티를 검색해보세요")
                    }
                    .font(.pretendardMedium16)
                    .foregroundStyle(Color.gray80)
                    Spacer()
                } else {
                    SearchMainView(
                        selectedTab: $viewModel.selectedOrderType,
                        isLoading: $viewModel.isLoading,
                        parties: viewModel.partyList
                    )
                }
            }
            
            // 5. 필터 바텀 시트
            .sheet(isPresented: $viewModel.isShowingFilterView) {
                SearchFilterView(
                    viewModel: viewModel,
                    contentHeight: $filterContentHeight
                )
                .presentationDetents([.height(filterContentHeight)])
                .presentationDragIndicator(.visible)
            }
        }
    }

}

#Preview {
    NavigationStack {
        SearchView()
    }
}
