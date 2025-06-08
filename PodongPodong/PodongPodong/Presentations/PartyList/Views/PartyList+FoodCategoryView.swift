//
//  PartyListFoodCategoryView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/8/25.
//

import SwiftUI

extension PartyListView {
    struct PartyListFoodCategoryView: View {
        @Binding var selectedFoodCategory: FoodCategory
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(FoodCategory.allCases) { category in
                        SelectableChipButtonView(
                            title: category.displayName,
                            isSelected: Binding(
                                get: { selectedFoodCategory == category },
                                set: { _ in selectedFoodCategory = category }
                            )
                        ) {
                            selectedFoodCategory = category
                        }
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.white)
            }
        }
    }
}
