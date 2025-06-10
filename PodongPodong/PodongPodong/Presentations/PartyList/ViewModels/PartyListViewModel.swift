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
    
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    private(set) var partyList: [Party] = []
    
    init() {
        partyListFetch()
    }
    
    var currentParties: [Party] {
        partyList
            .filter { $0.orderType == selectedOrderType }
            .filter { selectedFoodCategory == .all || $0.category == selectedFoodCategory }
    }
    
    func partyListFetch(){
        Task {
            do {
                isLoading = true
                
                // TODO: 필터 조건에 맞게 데이터 가져오도록 변경
                let fetchParties = try await FirestoreManager.shared.fetch(as: Party.self, .party)
                partyList.append(contentsOf: fetchParties)
                
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
