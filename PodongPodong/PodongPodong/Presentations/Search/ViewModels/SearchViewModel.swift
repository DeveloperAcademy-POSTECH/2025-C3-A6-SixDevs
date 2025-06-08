//
//  SearchViewModel.swift
//  PodongPodong
//
//  Created by Paidion on 6/4/25.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    var selectedOrderType: OrderType = .groupPurchase
    
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
            .sink { [weak self] _, _, _, text in
                //MARK: 검색어가 없으면 fetch 하지 않음
                guard !text.isEmpty else { return }
                Task { await self?.fetchPartyList() }
            }
            .store(in: &cancellables)
    }
    
    func fetchPartyList() async {
        await MainActor.run { self.isLoading = true }
        defer { Task { @MainActor in self.isLoading = false } }
        do {
            let parties: [Party] = try await FirestoreManager.shared.fetch(
                as: Party.self,
                .party,
                whereFeild: "title",
                equalData: searchText.isEmpty ? nil : searchText,
                count: 0
            )
            await MainActor.run {
                self.partyList = parties
            }
        } catch {
            print("파티 목록을 불러오는데 실패했습니다: \(error.localizedDescription)")
        }
    }
}
