//
//  PartyCreateViewModel.swift
//  PodongPodong
//
//  Created by 김서현 on 6/4/25.
//

import Foundation
import Observation

@Observable
final class PartyCreateViewModel {
    // 편집 모드 관련
    var isEditMode: Bool = false
    var editingParty: Party? = nil

    var selectedOrderType: OrderType? = nil
    var title: String = ""
    var selectedCategory: FoodCategory? = nil
    var recruitmentCount = 2
    var selectedPurchaseChannle: PurchaseChannel? = nil
    var purchaseLocation: String = ""

    var totalPrice: Int? = nil
    var selectedWeightAndCount: WeightAndCount? = nil
    var amount: Int? = nil

    var selectedDate: String = ""
    var selectedTime: String = ""
    var selectedPlace: String = ""
    var description: String = ""


    // 상태관련
    var errorMessage: String? = nil
    var isLoading: Bool = false
    var isCreateSuccess: Bool = false
    var isUpdateSuccess: Bool = false

    // MARK: - 편집 제한 관련
        var canEditRecruitmentCount: Bool {
            guard let party = editingParty else { return true }
            
            return party.member.isEmpty
        }
        
        var canEditOrderType: Bool {
            
            return !isEditMode
        }
        
        var editingRestrictionMessage: String? {
            if isEditMode && !canEditRecruitmentCount {
                return "이미 참여한 멤버가 있어 모집 인원을 변경할 수 없습니다."
            }
            return nil
        }
    
    
    // MARK: - 계산 프로퍼티
    var isButtonEnabled: Bool {
        let baseConditions =
            selectedOrderType != nil && !title.isEmpty
            && selectedCategory != nil && selectedPurchaseChannle != nil

        let groupPurchaseExtraConditions =
            totalPrice != nil && selectedWeightAndCount != nil && amount != nil

        switch selectedOrderType {
        case .groupPurchase:
            return baseConditions && groupPurchaseExtraConditions
        case .personalShopping:
            return baseConditions
        case .none:
            return false
        }
    }

    var navigationTitle: String {
        return isEditMode ? "파티 수정하기" : "파티 만들기"
    }

    var buttonTitle: String {
        return isEditMode ? "수정하기" : "생성하기"
    }

    var loadingMessage: String {
        return isEditMode ? "수정 중..." : "생성 중..."
    }

    // MARK: - 초기화
    init() {
        // 생성 모드로 기본 초기화
    }

    init(party: Party) {
        // 편집 모드로 초기화
        loadPartyData(party)
    }

    // MARK: - 편집 모드 관련 메서드
    func loadPartyData(_ party: Party) {
            isEditMode = true
            editingParty = party
            
            selectedOrderType = party.orderType
            title = party.title
            selectedCategory = party.category
            recruitmentCount = party.recruitmentCount
            selectedPurchaseChannle = party.purchaseChannel
            purchaseLocation = party.purchaseLocation
            
            totalPrice = party.totalPrice
            selectedWeightAndCount = party.weightAndCount
            amount = party.amount
            
            selectedDate = party.appointment.date ?? ""
            selectedTime = party.appointment.time ?? ""
            selectedPlace = party.appointment.location ?? ""
            description = party.description ?? ""
        }
    
    
    
    
    // MARK: - 액션 메서드
    func performMainAction() {
            if isEditMode {
                updateParty()
            } else {
                createParty()
            }
        }
    
    
    func createParty() {
        let party = Party(
            writen: DummyData.user,
            title: title,
            category: selectedCategory ?? .etc,
            orderType: selectedOrderType ?? .groupPurchase,
            recruitmentCount: recruitmentCount,
            purchaseChannel: selectedPurchaseChannle ?? .online,
            purchaseLocation: purchaseLocation,
            totalPrice: totalPrice ?? 0,
            weightAndCount: selectedWeightAndCount ?? .count,
            amount: amount ?? 0,
            appointment: Party.Appointment(
                date: selectedDate,
                time: selectedTime,
                location: selectedPlace
            ),
            description: description,
            chatURL: ""
        )

        Task {
            do {
                isLoading = true
                let _ = try await FirestoreManager.shared.create(party)
                isLoading = false
                isCreateSuccess = true
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func updateParty() {
            guard var party = editingParty else {
                errorMessage = "수정할 파티 정보를 찾을 수 없습니다."
                return
            }
            
            // 파티 데이터 업데이트
            party.title = title
            party.category = selectedCategory ?? party.category
            party.recruitmentCount = recruitmentCount
            party.purchaseChannel = selectedPurchaseChannle ?? party.purchaseChannel
            party.purchaseLocation = purchaseLocation
            party.totalPrice = totalPrice ?? party.totalPrice
            party.weightAndCount = selectedWeightAndCount ?? party.weightAndCount
            party.amount = amount ?? party.amount
            party.appointment = Party.Appointment(
                date: selectedDate.isEmpty ? nil : selectedDate,
                time: selectedTime.isEmpty ? nil : selectedTime,
                location: selectedPlace.isEmpty ? nil : selectedPlace
            )
            party.description = description.isEmpty ? nil : description
            party.updatedAt = Date()
            
            Task {
                do {
                    isLoading = true
                    try await FirestoreManager.shared.update(party)
                    isLoading = false
                    isUpdateSuccess = true
                } catch {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
        
        // MARK: - 상태 리셋
        func resetForm() {
            selectedOrderType = nil
            title = ""
            selectedCategory = nil
            recruitmentCount = 2
            selectedPurchaseChannle = nil
            purchaseLocation = ""
            totalPrice = nil
            selectedWeightAndCount = nil
            amount = nil
            selectedDate = ""
            selectedTime = ""
            selectedPlace = ""
            description = ""
            errorMessage = nil
            isLoading = false
            isCreateSuccess = false
            isUpdateSuccess = false
        }
}
