//
//  PartyDetailViewModel+Helpers.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/8/25.
//

import Foundation

// MARK: - Helper Methods
extension PartyDetailViewModel {
    
    // 현재 유저 역할 업데이트
    func updateUserRole() {
        guard let party = party else {
            currentUserRole = .guest
            return
        }

        let currentUserID = getCurrentUserID()

        if party.writen.id == currentUserID {
            currentUserRole = .host
        } else if party.member.contains(where: { $0.id == currentUserID }) {
            currentUserRole = .member
        } else if party.waitingMembers.contains(where: {
            $0.id == currentUserID
        }) {
            currentUserRole = .waitingMember
        } else {
            currentUserRole = .guest
        }
    }

    // 현재 로그인한 사용자 정보 가져오기
    func getCurrentUser() -> User {
        // TODO: 실제 로그인한 사용자 정보 반환하도록 구현
        return User.sampleCurrentUser
    }

    // 현재 로그인한 사용자 ID 가져오기
    func getCurrentUserID() -> UUID {
        return getCurrentUser().id
    }
    
    var commentCount: Int {
        guard let party else { return 0 }
        return party.comments.count
        
    }
}
