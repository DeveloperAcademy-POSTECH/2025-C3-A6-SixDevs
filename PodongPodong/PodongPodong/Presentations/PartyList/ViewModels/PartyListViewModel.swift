//
//  PartyListViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation
import Observation

@Observable
final class PartyListViewModel {
    var selectedOrderType: OrderType = .groupPurchase
    var selectedFoodCategory: FoodCategory = .all
    private(set) var partyList: [Party] = []
    
    var currentParties: [Party] {
        partyList
            .filter { $0.orderType == selectedOrderType }
            .filter { selectedFoodCategory == .all || $0.category == selectedFoodCategory }
    }
    
    init() {
        partyList = DummyData.allParties
    }
}
