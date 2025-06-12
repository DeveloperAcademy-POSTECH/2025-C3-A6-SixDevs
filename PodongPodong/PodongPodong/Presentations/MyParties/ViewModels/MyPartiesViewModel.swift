//
//  MyPartiesViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation
import Observation

@Observable
final class MyPartiesViewModel {
    var selectedPartyStatus: PartyStatus = .recruiting

    var isLoading: Bool = false
    var errorMessage: String? = nil

    private(set) var partyList: [Party] = []
    private var user: User? = {
        guard
            let data = UserDefaults.standard.data(forKey: UserDefaults.userKey),
            let user = try? JSONDecoder().decode(User.self, from: data)
        else {
            return nil
        }
        return user
    }()

    init() {
        myPartiesFetch()
    }

    var myParties: [Party] {
        guard let user else { return [] }

        return partyList
            .filter { party in
                party.writen.id == user.id
                    || party.member.contains { $0.id == user.id }
            }
            .filter { $0.status == selectedPartyStatus }
    }

    func myPartiesFetch() {
        Task {
            do {
                isLoading = true
                errorMessage = nil

                // 전체 파티 데이터를 가져온 후 클라이언트에서 필터링
                // TODO: 서버에서 사용자 관련 파티만 필터링해서 가져오도록 최적화 필요
                let fetchedParties = try await FirestoreManager.shared.fetch(
                    as: Party.self,
                    .party,
                    order: "createdAt"
                )
                partyList = fetchedParties

                isLoading = false
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
            }
        }
    }

    func refreshMyParties() {
        myPartiesFetch()
    }

    
    func reloadUserAndRefresh() {
            // UserDefaults에서 사용자 정보 다시 로드
            if let data = UserDefaults.standard.data(forKey: UserDefaults.userKey),
               let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
                user = updatedUser
                myPartiesFetch()
            } else {
                user = nil
                partyList = []
                errorMessage = "사용자 정보를 찾을 수 없습니다. 다시 로그인해주세요."
            }
        }
}
