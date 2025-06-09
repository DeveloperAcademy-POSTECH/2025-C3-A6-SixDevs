//
//  PartyCreateViewModel.swift
//  PodongPodong
//
//  Created by 김서현 on 6/4/25.
//

import SwiftUI

struct PartyCreateView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel = PartyCreateViewModel()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 38){
                OrderTypeView(selectedOrderType: $viewModel.selectedOrderType)
                TitleView(title: $viewModel.title)
                CategoryView(selectedCategory: $viewModel.selectedCategory)
                RecruitmentCountView(recruitmentCount: $viewModel.recruitmentCount)
                PurchaseLocationView(selectedPurchaseChannel: $viewModel.selectedPurchaseChannle)
                if viewModel.selectedOrderType == .groupPurchase {
                    PriceAndWeightView(
                        totalPrice: $viewModel.totalPrice,
                        selectedweightAndCount: $viewModel.selectedweightAndCount,
                        amount: $viewModel.amount
                    )
                }
                AppointmentView(
                    selectedDate: $viewModel.selectedDate,
                    selectedTime: $viewModel.selectedTime,
                    selectedPlace: $viewModel.selectedPlace
                )
                DescriptionView(description: $viewModel.description)
            }
        }
        .navigationBarTitle("파티 만들기", displayMode: .inline)
        .navigationBarItems(
            leading: BackButton(dismiss: dismiss),
            trailing: EmptyView()
        )
    }
}

#Preview {
    PartyCreateView()
}
