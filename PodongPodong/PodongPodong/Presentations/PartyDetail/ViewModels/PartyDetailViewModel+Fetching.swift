//
//  Sex.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/8/25.
//

import Foundation
import SwiftUI

// MARK: - Data Fetching
extension PartyDetailViewModel {
    
    func fetchPartyDetail() async {
        isLoading = true
        do {
            let fetchedParty: Party? = try await firestoreManager.get(
                partyID,
                collectionType: .party
            )

            guard let fetchedParty = fetchedParty else {
                throw PartyDetailError.partyNotFound
            }

            self.party = fetchedParty

            updateUserRole()

            if !viewCountUpdated {
                await incrementViewCount()
                viewCountUpdated = true
            }

            checkIfLiked()
            await checkAndAutoCloseIfNeeded()

        } catch {
            handleError(error)
        }
        isLoading = false
    }

    func refreshPartyDetail() async {
        await fetchPartyDetail()
    }
    
    func checkAndAutoCloseIfNeeded() async {
        guard var party = party,
            party.status == .recruiting,
            party.member.count >= party.recruitmentCount
        else { return }

        do {
            party.status = .inProgress

            try await firestoreManager.update(party)
            self.party = party

        } catch {
            print("자동 마감 실패: \(error)")
        }
    }

    func updateLikeCount(increment: Bool) async {
        guard let party = party else { return }

        do {
            try await firestoreManager.updateFieldByOne(
                party,
                field: "likeCount",
                increase: increment
            )

            if var updatedParty = self.party {
                updatedParty.likeCount += increment ? 1 : -1
                self.party = updatedParty
            }
        } catch {
            print("좋아요 업데이트 실패\(error)")
        }
    }
    
    // MARK: - Private Method
    private func incrementViewCount() async {
        guard let party = party else { return }

        do {
            try await firestoreManager.updateFieldByOne(
                party,
                field: "viewCount",
                increase: true
            )

            if var updatedParty = self.party {
                updatedParty.viewCount += 1
                self.party = updatedParty
            }
        } catch {
            print("조회수 업데이트 실패\(error)")
        }
    }
    
    private func checkIfLiked() {
        isLiked = false
    }
}
