//
//  SearchFilterView.swift
//  PodongPodong
//
//  Created by Paidion on 6/6/25.
//

import SwiftUI

struct SearchFilterView: View {
    @ObservedObject var viewModel: SearchViewModel
    let initialFoodCategory: FoodCategory?
    let initialPurchaseChannel: PurchaseChannel?
    @Binding var contentHeight: CGFloat
    
    @State private var selectedFoodCategory: FoodCategory?
    @State private var selectedPurchaseChannel: PurchaseChannel?
    @State private var isShowingPopover = false

    var body: some View {
        VStack {
            VStack(spacing:24) {
                Text("필터링")
                    .font(.pretendardBold20)
                    .foregroundColor(.gray80)
                VStack(spacing: 8) {
                    HStack{
                        Text("카테고리")
                            .font(.pretendardMedium14)
                            .foregroundColor(.gray60)
                        Spacer()
                    }
                    CategoryTagsView(
                        categories: FoodCategory.allCases,
                        selectedCategory: $selectedFoodCategory
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Text("구매처")
                            .font(.pretendardMedium14)
                            .foregroundColor(.gray60)
                        
                        Button(action: {
                            isShowingPopover = true
                        }) {
                            Image(systemName: "info.circle")
                                .font(.pretendardMedium14)
                                .foregroundColor(.gray60)
                        }
                        .popover(
                            isPresented: $isShowingPopover,
                            arrowEdge: .leading
                        ) {
                            Text("장보기는 오프라인 구매처에서만\n구매할 수 있어요")
                                .font(.pretendardMedium14)
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .presentationBackground(Color.secondary)
                                .presentationCompactAdaptation(.popover)
                        }
                        Spacer()
                    }
                    HStack(spacing: 10) {
                        ForEach(PurchaseChannel.allCases, id: \.self) { purchaseChannel in
                            SelectableChipButtonView(
                                title: purchaseChannel.displayName,
                                isSelected: Binding(
                                    get: { selectedPurchaseChannel == purchaseChannel },
                                    set: { isSelected in
                                        selectedPurchaseChannel = isSelected ? purchaseChannel : nil
                                    }
                                ),
                                action: {
                                    selectedPurchaseChannel = selectedPurchaseChannel != purchaseChannel ? purchaseChannel : nil
                                }
                            ).disabled(viewModel.selectedTab == .장보기)
                        }
                        Spacer()
                    }
                }
                Button(action: {
                    viewModel.foodCategory = selectedFoodCategory
                    viewModel.purchaseChannel = selectedPurchaseChannel
                    viewModel.isShowingFilterView = false
                }) {
                    ActionButtonView(
                        title: "필터 적용하기",
                        isEnabled: true
                    )
                }
            }
        }
        .padding([.top, .leading, .trailing], 16)
        .background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear { contentHeight = proxy.size.height }
                    .onChange(of: proxy.size.height) {
                        contentHeight = proxy.size.height
                    }
            }
        )
        .onAppear {
            selectedFoodCategory = initialFoodCategory
            selectedPurchaseChannel = initialPurchaseChannel
        }
    }
    
}
