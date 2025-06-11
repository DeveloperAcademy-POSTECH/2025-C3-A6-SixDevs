//
//  PurchaseLocationView+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct PurchaseLocationView: View {
        @Binding var selectedPurchaseChannel: PurchaseChannel?
        @Binding var purchaseLocation: String
        
        var body: some View {
            VStack{
                Text("구매처")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium14)
                    .foregroundColor(.gray60)
                    .padding(.bottom, 8)
                
                HStack(spacing: 12){
                    Spacer().frame(width:16)
                    ForEach(PurchaseChannel.allCases) { purchaseChannel in
                        SelectableChipButtonView(
                            title: purchaseChannel.displayName,
                            isSelected: .constant(selectedPurchaseChannel == purchaseChannel),
                            action: { selectedPurchaseChannel = purchaseChannel }
                        )
                    }
                    Spacer()
                } //:HSTACK
                TextFieldView(
                    text: $purchaseLocation, 
                    placeholder: selectedPurchaseChannel == .online
                        ? "구매처 정보를 입력해주세요 (URL 등)"
                        : "구매처 정보를 입력해주세요 (장소명 등)"
                )
                .frame(width: 361, height: 48)
                // TODO: 장보기 선택했을 때 구매처 오프라인으로 고정
            }
        }
    }
}
