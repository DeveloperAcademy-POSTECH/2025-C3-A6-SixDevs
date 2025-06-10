//
//  PartyDetailHeaderView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import SwiftUI

struct PartyDetailHeaderView: View {
    @ObservedObject var viewModel: PartyDetailViewModel
    let party: Party

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
        Text(party.title)
            .font(.pretend(type: .bold, size: 20))
            .padding(.bottom, 24)
    }

    // MARK: - Statistics Section
    private var statisticsSection: some View {
        HStack {
            Text(viewModel.getTimeAgoText)
            Spacer()
            Text("조회 \(party.viewCount)")
            Text("관심 \(party.likeCount)")
            Text("댓글 \(viewModel.commentCount)")
        }
        .font(.pretend(type: .semibold, size: 12))
        .foregroundStyle(Color.gray60)
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
        ),
        party: Party.sampleData
    )
}
