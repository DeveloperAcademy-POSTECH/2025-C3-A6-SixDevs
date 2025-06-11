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

        if party.writen.id == user.id {
            currentUserRole = .host
        } else if party.member.contains(where: { $0.id == user.id }) {
            currentUserRole = .member
        } else if party.waitingMembers.contains(where: {
            $0.id == user.id
        }) {
            currentUserRole = .waitingMember
        } else {
            currentUserRole = .guest
        }
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
        return party.writen.id == user.id
    }

    var isParticipant: Bool {
        guard let party = party else { return false }
        return party.member.contains { $0.id == user.id }
    }

    var isWaitingMember: Bool {
        guard let party = party else { return false }
        return party.waitingMembers.contains { $0.id == user.id }
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
