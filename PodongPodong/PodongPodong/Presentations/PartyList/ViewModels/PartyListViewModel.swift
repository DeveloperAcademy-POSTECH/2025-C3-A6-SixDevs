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
            if selectedFoodCategory != .all {
                return partyList.filter { $0.orderType == .groupPurchase && $0.category == selectedFoodCategory }
            }
            
            return partyList.filter { $0.orderType == .groupPurchase }
        case .personalShopping:
            if selectedFoodCategory != .all {
                return partyList.filter { $0.orderType == .personalShopping && $0.category == selectedFoodCategory }
            }
            
            return partyList.filter { $0.orderType == .personalShopping }
        }
    }
}
