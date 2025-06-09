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

    var isButtonEnabled: Bool {
        selectedOrderType != nil &&
        !title.isEmpty &&
        selectedCategory != nil &&
        selectedPurchaseChannle != nil &&
        totalPrice != nil &&
        selectedWeightAndCount != nil &&
        amount != nil
    }
}
