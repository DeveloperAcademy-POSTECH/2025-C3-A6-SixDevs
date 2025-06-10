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
                /// + 파티 페이징화, 현재는 데이터를 덮어씌우는 로직
                /// 그리고 전체를 들고 오는 중
                let fetchParties = try await FirestoreManager.shared.fetch(as: Party.self, .party)
                partyList = fetchParties
                
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
