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
    var selectedTab: OrderType = .groupPurchase
    private(set) var partyList: [Party] = []
    
    var currentParties: [Party] {
        switch selectedTab {
        case .groupPurchase:
            return partyList.filter { $0.orderType == .groupPurchase }
        case .personalShopping:
            return partyList.filter { $0.orderType == .personalShopping }
        }
    }
    
    init() {
        partyList = DummyData.allParties
    }
}
