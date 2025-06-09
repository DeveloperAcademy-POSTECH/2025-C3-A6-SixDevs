//
//  PartyDetailViewModel+Helpers.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/8/25.
//

import Foundation

// MARK: - Helper Methods
extension PartyDetailViewModel {
    
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
    
    var participantMemberCount: Int {
        guard let members = party?.member else { return 0 }
        return members.isEmpty ? 0 : members.count + 1
    }

    var isHost: Bool {
        guard let party = party else { return false }
        return party.writen.id == getCurrentUserID()
    }

    var isParticipant: Bool {
        guard let party = party else { return false }
        return party.member.contains { $0.id == getCurrentUserID() }
    }

    var isWaitingMember: Bool {
        guard let party = party else { return false }
        return party.waitingMembers.contains { $0.id == getCurrentUserID() }
    }

    var isRecruitmentComplete: Bool {
        guard let party = party else { return false }
        return party.status != .recruiting
    }
    
    // 시간 계산 메서드
    var getTimeAgoText: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(
            for: party?.createdAt ?? Date(),
            relativeTo: Date()
        )
    }
}
