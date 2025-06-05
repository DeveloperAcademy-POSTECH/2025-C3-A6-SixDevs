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
    
    init() {
        partyList.append(DummyData.party)
    }
}
