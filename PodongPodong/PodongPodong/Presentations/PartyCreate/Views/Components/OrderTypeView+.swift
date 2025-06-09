//
//  PartyCreate+OrderTypeView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct OrderTypeView: View {
        @Binding var selectedOrderType: OrderType?

        var body: some View{
            VStack{
                Text("구매 방식")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                
                RadioButton(image:"person.2", label: "공동구매", description: "여러 명이 모여 더 싸게 구매할 수 있어요.", isSelected: selectedOrderType == .groupPurchase){
                    selectedOrderType = .groupPurchase
                }
                RadioButton(image: "cart.fill", label: "장보기", description: "함께 모여 오프라인 구매처에서 장을 볼 수 있어요.", isSelected: selectedOrderType == .personalShopping){
                    selectedOrderType = .personalShopping
                }
            }
        }
    }
}
