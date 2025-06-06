//
//  SearchViewModel.swift
//  PodongPodong
//
//  Created by Paidion on 6/4/25.
//

import Foundation
import Observation

@Observable
final class SearchViewModel: ObservableObject {
    var selectedTab: PartyListTab = .공동구매
    
    var searchText: String = ""
    var isLoading: Bool = false
    var isShowingFilterView: Bool = false
    
    
    
    // MARK: 필터
    var isShowingNotCompletedPartyOnly: Bool = false
    var foodCategory: FoodCategory? = nil
    var purchaseChannel: PurchaseChannel? = nil
    var isFilterApplied: Bool {
        foodCategory != nil
        || purchaseChannel != nil
    }
    
    
    private(set) var partyList: [Party] = []
    
    init() {
        partyList.append(DummyData.party)
    }
}
