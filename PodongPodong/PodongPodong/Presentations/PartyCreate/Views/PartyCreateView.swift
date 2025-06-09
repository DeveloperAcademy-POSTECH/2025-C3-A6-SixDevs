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
    @EnvironmentObject var router: MainNavigationRouter
    
    var body: some View {
        ZStack {
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
                        viewModel.createParty()
                    } label: {
                        ActionButtonView(title: "생성하기", isEnabled: viewModel.isButtonEnabled)
                            .frame(width: 351)
                    }
                }
            }
            if viewModel.isLoading {
                VStack(spacing: 16) {
                    ProgressView("생성 중...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                        .tint(.white)
                }
                .padding(24)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0.8)))
            }
        }
        .navigationBarTitle("파티 만들기", displayMode: .inline)
        .navigationBarItems(
            leading: BackButton(dismiss: dismiss),
            trailing: EmptyView()
        )
        .alert("에러", isPresented: Binding<Bool>(
            get: { viewModel.errorMessage != nil },
            set: { isPresented in
                if !isPresented {
                    viewModel.errorMessage = nil
                }
            }
        )) {
            Button("확인", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage ?? "알 수 없는 에러가 발생했어요.")
        }
        .onChange(of: viewModel.isCreateSuccess) { isSuccess in
            if isSuccess {
                // TODO: DetailView 이동
            }
        }
    }
}

#Preview {
    PartyCreateView()
}
