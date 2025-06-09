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
                PurchaseLocationView(
                    selectedPurchaseChannel: $viewModel.selectedPurchaseChannle,
                    purchaseLocation: $viewModel.purchaseLocation
                )
                if viewModel.selectedOrderType == .groupPurchase {
                    PriceAndWeightView(
                        totalPrice: $viewModel.totalPrice,
                        selectedWeightAndCount: $viewModel.selectedWeightAndCount,
                        amount: $viewModel.amount
                    )
                }
                AppointmentView(
                    selectedDate: $viewModel.selectedDate,
                    selectedTime: $viewModel.selectedTime,
                    selectedPlace: $viewModel.selectedPlace
                )
                DescriptionView(description: $viewModel.description)
                Button {
                    // TODO: 생성 로직
                } label: {
                    ActionButtonView(title: "생성하기", isEnabled: viewModel.isButtonEnabled)
                        .frame(width: 351)
                }
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
