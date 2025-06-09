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
    
    // 파티 정보 가져오기
    func fetchPartyDetail() async {
        isLoading = true

        do {
            // 파티 정보 가져오기
            let fetchedParty: Party? = try await firestoreManager.get(
                partyID,
                collectionType: .party
            )

            guard let fetchedParty = fetchedParty else {
                throw PartyDetailError.partyNotFound
            }

            self.party = fetchedParty

            // 현재 유저 역할 판단
            updateUserRole()

            // 조회수 증가
            if !viewCountUpdated {
                await incrementViewCount()
                viewCountUpdated = true
            }

            // 좋아요 상태 확인
            checkIfLiked()

            // 자동 마감 체크
            await checkAndAutoCloseIfNeeded()

        } catch {
            handleError(error)
        }
        isLoading = false
    }

    // 파티 정보 새로고침
    func refreshPartyDetail() async {
        await fetchPartyDetail()
    }
    
    // 자동 마감 체크 및 실행
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

    // 좋아요 수 증가
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
    // 조회수 증가
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
    
    // 좋아요 상태 확인
    private func checkIfLiked() {
        isLiked = false
    }
}
