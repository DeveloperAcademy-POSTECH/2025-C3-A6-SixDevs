//
//  SearchViewModel.swift
//  PodongPodong
//
//  Created by Paidion on 6/4/25.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    var selectedTab: PartyListTab = .공동구매

    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var isShowingFilterView: Bool = false

    // MARK: 필터
    @Published var isShowingNotCompletedPartyOnly: Bool = false
    @Published var foodCategory: FoodCategory? = nil
    @Published var purchaseChannel: PurchaseChannel? = nil

    var isFilterApplied: Bool {
        foodCategory != nil
        || purchaseChannel != nil
    }

    @Published private(set) var partyList: [Party] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        Publishers.CombineLatest4($isShowingNotCompletedPartyOnly, $foodCategory, $purchaseChannel, $searchText)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] _, _, _, _ in
                Task { await self?.fetchPartyList() }
            }
            .store(in: &cancellables)
    }

    func fetchPartyList() async {
        Task {
            do {
                let parties: [Party] = try await FirestoreManager.shared.fetch(
                    as: Party.self,
                    .party,
                    whereFeild: "title",
                    // equalData: searchText.isEmpty ? nil : searchText,
                    // count: 0
                )
                await MainActor.run {
                    self.partyList = parties
                }
            } catch {
                print("파티 목록을 불러오는데 실패했습니다: \(error.localizedDescription)")
            }
        }
    }
    
    
}
