//
//  PartyDetailVIewModel+ViewConfiguration.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/8/25.
//

import SwiftUI

// MARK: - View Configuration
extension PartyDetailViewModel {
    
    struct ViewConfiguration {
        // Bottom View
        let actionButtonTitle: String
        let actionButtonColor: Color
        let actionButtonTextColor: Color
        let isActionButtonEnabled: Bool

        // Header View
        let showParticipantBadge: Bool
        let showWaitingBadge: Bool

        // Participant View
        let showChatButton: Bool
        let showWaitingMembers: Bool
        let canManageMembers: Bool
        let participantCount: Int
    }

    var viewConfiguration: ViewConfiguration {
        guard let party = party else {
            return ViewConfiguration(
                actionButtonTitle: "로딩중...",
                actionButtonColor: Color.gray20,
                actionButtonTextColor: Color.gray80,
                isActionButtonEnabled: false,
                showParticipantBadge: false,
                showWaitingBadge: false,
                showChatButton: false,
                showWaitingMembers: false,
                canManageMembers: false,
                participantCount: 0
            )
        }

        // Bottom View Configuration
        let (buttonTitle, buttonColor, textColor, isEnabled) =
            getActionButtonConfiguration(for: party)

        // Header View Configuration
        let showParticipantBadge = currentUserRole == .member
        let showWaitingBadge = currentUserRole == .waitingMember

        // Participant View Configuration
        let showChatButton =
            currentUserRole == .host || currentUserRole == .member
        let showWaitingMembers = currentUserRole == .host
        let canManageMembers = currentUserRole == .host
        let participantCount = party.member.count + 1  // +1 for host

        return ViewConfiguration(
            actionButtonTitle: buttonTitle,
            actionButtonColor: buttonColor,
            actionButtonTextColor: textColor,
            isActionButtonEnabled: isEnabled,
            showParticipantBadge: showParticipantBadge,
            showWaitingBadge: showWaitingBadge,
            showChatButton: showChatButton,
            showWaitingMembers: showWaitingMembers,
            canManageMembers: canManageMembers,
            participantCount: participantCount
        )
    }

    // MARK: - Private Configuration Methods
    private func getActionButtonConfiguration(for party: Party) -> (
        title: String, color: Color, textColor: Color, isEnabled: Bool
    ) {
        switch (currentUserRole, party.status) {
        case (.host, .recruiting):
            return ("파티 마감하기", .primaryColor, .secondary, true)
        case (.host, .inProgress):
            return ("공구 종료하기", .red00, .red10, true)
        case (.host, .completed):
            return ("공구가 종료되었습니다", .gray10, .gray30, false)

        case (.member, .recruiting):
            return ("파티 탈퇴하기", .red00, .red10, true)
        case (.member, .inProgress):
            return ("공구가 진행중입니다", .gray10, .gray30, false)
        case (.member, .completed):
            return ("공구가 종료되었습니다", .gray10, .gray30, false)

        case (.waitingMember, .recruiting):
            return ("참여 신청 취소", .red00, .red10, true)
        case (.waitingMember, _):
            return ("모집이 마감되었습니다", .gray10, .gray30, false)

        case (.guest, .recruiting):
            return ("참여 신청하기", .primaryColor, .secondary, true)
        case (.guest, _):
            return ("모집이 마감되었습니다", .gray10, .gray30, false)
        }
    }
    
    // MARK: - 시간 계산 메서드
    func getTimeAgoText() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(
            for: party?.createdAt ?? Date(),
            relativeTo: Date()
        )
    }
}

