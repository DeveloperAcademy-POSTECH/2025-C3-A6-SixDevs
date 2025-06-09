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
    @State var description: String = ""
    
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
                DescriptionView(description: $description)
            }
        }
    }
}

#Preview {
    PartyCreateView()
}
