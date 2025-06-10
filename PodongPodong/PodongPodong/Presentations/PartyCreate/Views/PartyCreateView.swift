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

    // MARK: - 초기화
    init() {
        self._viewModel = State(initialValue: PartyCreateViewModel())
    }

    init(party: Party) {
        self._viewModel = State(
            initialValue: PartyCreateViewModel(party: party)
        )
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 38) {
                    // 편집 모드에서는 구매 방식 변경 불가
                    if !viewModel.isEditMode {
                        OrderTypeView(
                            selectedOrderType: $viewModel.selectedOrderType
                        )
                    } else {
                        EditingOrderTypeDisplayView(
                            orderType: viewModel.selectedOrderType
                                ?? .groupPurchase
                        )
                    }

                    TitleView(title: $viewModel.title)
                    CategoryView(selectedCategory: $viewModel.selectedCategory)
                    RecruitmentCountView(
                        recruitmentCount: $viewModel.recruitmentCount,
                        canEdit: viewModel.canEditRecruitmentCount,
                        restrictionMessage: viewModel.editingRestrictionMessage
                    )
                    PurchaseLocationView(
                        selectedPurchaseChannel: $viewModel
                            .selectedPurchaseChannle,
                        purchaseLocation: $viewModel.purchaseLocation
                    )
                    if viewModel.selectedOrderType == .groupPurchase {
                        PriceAndWeightView(
                            totalPrice: $viewModel.totalPrice,
                            selectedWeightAndCount: $viewModel
                                .selectedWeightAndCount,
                            amount: $viewModel.amount
                        )
                    }
                    AppointmentView(
                        selectedDate: $viewModel.selectedDate,
                        selectedTime: $viewModel.selectedTime,
                        selectedPlace: $viewModel.selectedPlace
                    )
                    DescriptionView(
                        description: $viewModel.description,
                        isEditMode: viewModel.isEditMode
                    )

                    // 생성/편집 모드에 따라 버튼 작동
                    Button {
                        viewModel.performMainAction()
                    } label: {
                        ActionButtonView(
                            title: viewModel.buttonTitle,
                            isEnabled: viewModel.isButtonEnabled
                        )
                        .frame(width: 351)
                    }
                }
            }
            if viewModel.isLoading {
                VStack(spacing: 16) {
                    ProgressView(viewModel.loadingMessage)
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                        .tint(.white)
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(
                        Color.black.opacity(0.8)
                    )
                )
            }
        }
        .navigationBarTitle(viewModel.navigationTitle, displayMode: .inline)
        .navigationBarItems(
            leading: BackButton(dismiss: dismiss),
            trailing: EmptyView()
        )
        .alert(
            "에러",
            isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { isPresented in
                    if !isPresented {
                        viewModel.errorMessage = nil
                    }
                }
            )
        ) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "알 수 없는 에러가 발생했어요.")
        }
        .onChange(of: viewModel.isCreateSuccess) { isSuccess in
            if isSuccess {
                dismiss()
                // TODO: DetailView 이동

            }
        }
        .onChange(of: viewModel.isUpdateSuccess) { isSuccess in
            if isSuccess {
                // 수정 완료 후 이전 화면(DetailView)으로 돌아감
                dismiss()
            }
        }
    }
}

#Preview {
    PartyCreateView()
}

#Preview("편집 모드") {
    PartyCreateView(party: DummyData.partyGroup1)
}
