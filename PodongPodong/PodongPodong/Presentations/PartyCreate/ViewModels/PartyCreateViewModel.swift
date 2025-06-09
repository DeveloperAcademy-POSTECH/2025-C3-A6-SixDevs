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
    var recruitmentCount = 2 //참여 인원
    var selectedPurchaseChannle: PurchaseChannel? = nil
    
    var totalPrice: Int? = nil
    var selectedweightAndCount: WeightAndCount? = nil
    var amount: Int? = nil
    
    var selectedDate: String = ""
    var selectedTime: String = ""
    var selectedPlace: String = ""
    var description: String = ""
}
