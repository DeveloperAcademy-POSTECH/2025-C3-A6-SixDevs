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
    
    var errorMessage: String? = nil
    var isLoading: Bool = false
    var isCreateSuccess: Bool = false
    
    var isButtonEnabled: Bool {
        let baseConditions =
        selectedOrderType != nil &&
        !title.isEmpty &&
        selectedCategory != nil &&
        selectedPurchaseChannle != nil
        
        let groupPurchaseExtraConditions =
        totalPrice != nil &&
        selectedWeightAndCount != nil &&
        amount != nil
        
        switch selectedOrderType {
        case .groupPurchase:
            return baseConditions && groupPurchaseExtraConditions
        case .personalShopping:
            return baseConditions
        case .none:
            return false
        }
    }
    
    func createParty(){
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
            } catch {
                errorMessage = error.localizedDescription
            }
            isCreateSuccess = true
        }
    }
}
