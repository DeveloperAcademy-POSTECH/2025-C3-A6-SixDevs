//
//  EditModeOrderTypeDisplayView+.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/10/25.
//

import SwiftUI

// MARK: - 편집 모드용 OrderType 표시 뷰
extension PartyCreateView {
    struct EditingOrderTypeDisplayView: View {
        let orderType: OrderType
        
        var body: some View {
            VStack {
                Text("구매 방식")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium14)
                    .foregroundColor(.gray60)
                    .padding(.bottom, 8)
                
                HStack {
                    Image(systemName: orderType == .groupPurchase ? "person.2" : "cart.fill")
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(orderType.title)
                            .font(.pretendardMedium16)
                            .foregroundColor(.black)
                        
                        Text(orderType == .groupPurchase
                             ? "여러 명이 모여 더 싸게 구매할 수 있어요."
                             : "함께 모여 오프라인 구매처에서 장을 볼 수 있어요.")
                            .font(.pretendardLight14)
                            .foregroundColor(.gray70)
                    }
                    
                    Spacer()
                    
                    Text("수정 불가")
                        .font(.pretend(type: .light, size: 12))
                        .foregroundColor(.gray50)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.gray20)
                        .cornerRadius(4)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.gray10)
                .cornerRadius(8)
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    PartyCreateView(party: DummyData.partyGroup1)
}
