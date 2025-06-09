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
    
    init() {
        partyList = DummyData.allParties
    }
    
    var currentParties: [Party] {
        switch selectedOrderType {
        case .groupPurchase:
            return partyList.filter { $0.orderType == .groupPurchase }
        case .personalShopping:
            var partyList: [Party] = []
            var currentParties: [Party] {
                partyList
                    .filter { $0.orderType == selectedOrderType }
                    .filter { selectedFoodCategory == .all || $0.category == selectedFoodCategory }
                
                
            }
            
            return partyList.filter { $0.orderType == .personalShopping }
        }
    }
}
