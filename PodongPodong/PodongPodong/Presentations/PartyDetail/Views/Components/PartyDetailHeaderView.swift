//
//  PartyDetailHeaderView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import SwiftUI

struct PartyDetailHeaderView: View {
    let party: Party
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
            stateButton(
                title: "참여중",
                fontColor: Color.blue10,
                backgroundColor: Color.blue00
            )
            
        } else if viewModel.currentUserRole == .waitingMember {
            stateButton(
                title: "참여 대기중",
                fontColor: Color.purple10,
                backgroundColor: Color.purple00
            )
        }
    }

    struct stateButton: View {
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

    // MARK: - Title Section
    private var titleSection: some View {
        Text(party.title)
            .font(.pretend(type: .bold, size: 20))
            .padding(.bottom, 24)
    }

    // MARK: - Statistics Section
    private var statisticsSection: some View {
        HStack {
            Text("32분 전")
            Spacer()
            Text("조회 \(party.viewCount)")
            Text("관심 \(party.likeCount)")
            Text("댓글 \(party.comments.count)")
        }
        .font(.pretend(type: .semibold, size: 12))
        .foregroundStyle(Color.gray60)
    }
}

#Preview {
    PartyDetailHeaderView(
        party: Party.sampleData,
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        )
    )
}
