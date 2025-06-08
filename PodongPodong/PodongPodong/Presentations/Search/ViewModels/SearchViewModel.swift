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
    
    // TODO: Model에서 정의된 부분을 Firebase 에서 가져올 수 있는 형태로 변환 필요 (예시, rawValue 로 쿼리보내기 등)
//    var filters: [String: Any] {
//        [
//            "title": searchText,
//            "status": isShowingNotCompletedPartyOnly,
//            "category": foodCategory ?? "",
//            "orderType": purchaseChannel,
//        ]
//    }

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
    
// TODO: 필터링 fetch 기능 확인 필요
//    func fetchPartyListWithFilters() async {
//        await MainActor.run { self.isLoading = true }
//        defer { Task { @MainActor in self.isLoading = false } }
//        do {
//            let parties: [Party] = try await FirestoreManager.shared.fetchWithFilters(
//                as: Party.self,
//                .party,
//                // TODO: fetch 하기 전, 설정한 필터만 적용하기 (예, 전체 카테고리와 전체 파티 상태는 필터 적용하지 않아도 됨)
//                filters: filters,
//                count: 0
//            )
//            await MainActor.run {
//                self.partyList = parties
//            }
//        } catch {
//            print("파티 목록을 불러오는데 실패했습니다: \(error.localizedDescription)")
//        }
//    }
}
