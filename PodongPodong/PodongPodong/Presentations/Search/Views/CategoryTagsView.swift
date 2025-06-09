//
//  CategoryTagsView.swift
//  PodongPodong
//
//  Created by Paidion on 6/7/25.
//

import SwiftUI

struct CategoryTagsView: View {
    let categories: [FoodCategory]
    @Binding var selectedCategory: FoodCategory?

    var groupedCategories: [[FoodCategory]] {
        var grouped: [[FoodCategory]] = []
        var temp: [FoodCategory] = []
        var width: CGFloat = 0
        let screenWidth = UIScreen.main.bounds.width - 32

        for category in categories {
            let label = UILabel()
            label.text = category.displayName
            label.sizeToFit()
            let labelWidth = label.frame.size.width + 32

            if (width + labelWidth + 55) < screenWidth {
                width += labelWidth
                temp.append(category)
            } else {
                width = labelWidth
                grouped.append(temp)
                temp.removeAll()
                temp.append(category)
            }
        }
        grouped.append(temp)
        return grouped
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(groupedCategories, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { category in
                        SelectableChipButtonView(
                            title: category.displayName,
                            isSelected: Binding(
                                get: { selectedCategory == category },
                                set: { isSelected in
                                    selectedCategory = isSelected ? category : nil
                                }
                            ),
                            action: {
                                selectedCategory = selectedCategory == category ? nil : category
                            }
                        )
                    }
                }
            }
        }
    }
}
