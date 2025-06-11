//
//  PriceAndWeightView+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct PriceAndWeightView: View {
        @Binding var totalPrice: Int?
        @Binding var selectedWeightAndCount: WeightAndCount?
        @Binding var amount: Int?
        
        var body: some View {
            VStack{
                Text("구매 비용")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium14)
                    .foregroundColor(.gray60)
                    .padding(.bottom, 8)
                
                TextFieldView(
                    intValue: $totalPrice,
                    placeholder: "총 구매 비용을 입력해주세요.",
                    suffixText: "원"
                ).frame(width: 361, height: 48)
            }
            
            VStack{
                Text("구매 단위")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                HStack(spacing: 12){
                    Spacer().frame(width:16)
                    ForEach(WeightAndCount.allCases) { weightAndCount in
                        SelectableChipButtonView(
                            title: weightAndCount.name,
                            isSelected: .constant(selectedWeightAndCount == weightAndCount),
                            action: { selectedWeightAndCount = weightAndCount }
                        )
                    }
                    Spacer()
                }
                if selectedWeightAndCount != nil{
                    TextFieldView(
                        intValue: $amount,
                        placeholder: "\(selectedWeightAndCount?.name ?? "")를 입력해주세요",
                        suffixText: selectedWeightAndCount?.displayName
                    ).frame(width: 361, height: 48)
                }
            }
        }
    }
}
