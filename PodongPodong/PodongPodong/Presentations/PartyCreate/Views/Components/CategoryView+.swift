//
//  CategoryView+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct CategoryView: View {
        @Binding var selectedCategory: FoodCategory?
        
        var body : some View{
            VStack{
                Text("구매 카테고리")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 8) {
                        ForEach(FoodCategory.allCases.dropFirst()) { category in
                            SelectableChipButtonView(
                                title: category.displayName,
                                isSelected: .constant( selectedCategory == category ),
                                action: { selectedCategory = category }
                            )
                        }
                    } //:HSTACK
                }
                .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    PartyCreateView()
}
