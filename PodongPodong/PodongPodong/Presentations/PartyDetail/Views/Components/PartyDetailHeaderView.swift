//
//  PartyDetailHeaderView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import SwiftUI

struct PartyDetailHeaderView: View {
    @ObservedObject var viewModel: PartyDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            stateSection
            titleSection
            statisticsSection
            Divider()
                .padding(.top, 10)
        }
    }

    // MARK: - State Section
    @ViewBuilder
    private var stateSection: some View {
        if viewModel.isParticipant {
            StateBadge(
                title: "참여중",
                fontColor: Color.blue10,
                backgroundColor: Color.blue00
            )

        } else if viewModel.isWaitingMember {
            StateBadge(
                title: "참여 대기중",
                fontColor: Color.purple10,
                backgroundColor: Color.purple00
            )
        }
    }

    // MARK: - Title Section
    private var titleSection: some View {
        Text(viewModel.viewConfiguration.partyTitle)
            .font(.pretend(type: .bold, size: 20))
            .padding(.bottom, 24)
    }

    // MARK: - Statistics Section
    private var statisticsSection: some View {
        HStack {
            Text(getTimeAgoText())
            Spacer()
            Text("조회 \(viewModel.viewCount)")
            Text("관심 \(viewModel.likeCount)")
            Text("댓글 \(viewModel.commentCount)")
        }
        .font(.pretend(type: .semibold, size: 12))
        .foregroundStyle(Color.gray60)
    }

    // MARK: - 시간 계산 메서드
    private func getTimeAgoText() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(
            for: viewModel.createdDate,
            relativeTo: Date()
        )
    }
}

// MARK: - State Badge Component
private struct StateBadge: View {
    let title: String
    let fontColor: Color
    let backgroundColor: Color

    var body: some View {
        Text(title)
            .font(.pretend(type: .semibold, size: 11))
            .foregroundStyle(fontColor)
            .padding(.vertical, 3)
            .padding(.horizontal, 8)
            .background(backgroundColor)
            .cornerRadius(6)
            .padding(.bottom, 12)
    }
}

#Preview {
    PartyDetailHeaderView(
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        )
    )
}
