//
//  PartyCreateViewModel.swift
//  PodongPodong
//
//  Created by 김서현 on 6/4/25.
//

import SwiftUI

struct PartyCreateView: View {
    @State private var selectedOrder: OrderType? = nil
    @State private var title: String = ""
    @State private var selectedCategory: FoodCategory? = nil
    @State private var recruitmentCount = 2 //참여 인원
    @State private var selectedPurchaseChannle: PurchaseChannel? = nil
    
    @State var totalPrice: Int? = nil
    @State var selectedweightAndCount: WeightAndCount? = nil
    @State var amount: Int? = nil
    
    @State var selectedDate: String = ""
    @State var selectedTime: String = ""
    @State var selectedPlace: String = ""
    
    var body: some View {
        ScrollView{
            VStack(spacing: 38){
                OrderTypeView(selectedOrderType: $selectedOrder)
                TitleView(title: $title)
                CategoryView(selectedCategory: $selectedCategory)
                RecruitmentCountView(recruitmentCount: $recruitmentCount)
                PurchaseLocationView(selectedPurchaseChannel: $selectedPurchaseChannle)
                if selectedOrder == .groupPurchase {
                    PriceAndWeightView(
                        totalPrice: $totalPrice,
                        selectedweightAndCount: $selectedweightAndCount,
                        amount: $amount
                    )
                }
                AppointmentView(
                    selectedDate: $selectedDate,
                    selectedTime: $selectedTime,
                    selectedPlace: $selectedPlace
                )
                descriptionView
            }
        }
    }
        
    // MARK: - descriptionView 설명(선택)
    @ViewBuilder
    var descriptionView: some View {
        VStack{
            Text("설명 (선택)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            Text("이런 내용을 적어보세요\n-가이드라인 1\n-가이드라인2\n-가이드라인3")
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .padding(.trailing, 152)
                .frame(width: 361)
                .background(Color.gray10)
                .foregroundColor(Color.gray70)
                .font(.pretendardMedium16)
                
                
            // TODO: 멀티라인 입력 처리하기
            TextFieldView(
                text: .constant(""),
                placeholder: "파티를 어떻게 운영할 것인지에 대한 구체적인 정보를 적어주세요.").frame(width: 361, height: 244)
        } //: VSTACK
    }
}

// TODO: 필수항목 선택항목 로직 추가해야함 (필수 항목 입력 안 하면 안 넘어가게)
#Preview {
    PartyCreateView()
}
