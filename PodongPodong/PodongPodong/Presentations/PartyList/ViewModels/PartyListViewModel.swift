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
    var selectedTab: PartyListTab = .공동구매
    private(set) var partyList: [Party] = []
    
    var currentParties: [Party] {
        switch selectedTab {
        case .공동구매:
            return partyList.filter { $0.orderType == .groupPurchase }
        case .장보기:
            return partyList.filter { $0.orderType == .personalShopping }
        }
    }
    
    init() {
        partyList = DummyData.allParties
    }
}
