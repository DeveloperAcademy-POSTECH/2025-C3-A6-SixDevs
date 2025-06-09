//
//  PartyDetailParticipantView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/5/25.
//

import SwiftUI

struct PartyDetailParticipantView: View {
    @ObservedObject var viewModel: PartyDetailViewModel
    let party: Party

    var body: some View {
        VStack {
            headerSection
            participantListSection
            dividerSection
        }
    }

    // MARK: - Header Section
    private var headerSection: some View {
        HStack {
            Text("참여 인원(\(viewModel.viewConfiguration.participantCount))")
                .foregroundStyle(Color.secondary)
                .font(.pretend(type: .bold, size: 16))

            Spacer()

            if viewModel.viewConfiguration.showChatButton {
                // TODO: 채팅방 뷰 연결
                NavigationLink(destination: EmptyView()) {
                    HStack {
                        Text("채팅방")
                        Image(systemName: "chevron.right")
                    }
                    .font(.pretend(type: .semibold, size: 14))
                    .foregroundStyle(Color.secondary)
                }
            }
        }
    }

    // MARK: - Participant List Section
    private var participantListSection: some View {
        ZStack {
            Color.gray00
            VStack(alignment: .leading, spacing: 20) {
                // Host
                ParticipantRow(
                    viewModel: viewModel,
                    user: party.writen,
                    isHost: true
                )

                // Members
                ForEach(party.member, id: \.id) { member in
                    ParticipantRow(
                        viewModel: viewModel,
                        user: member,
                        isHost: false
                        
                    )
                }

                // Waiting Members (호스트만 볼 수 있게)
                if viewModel.viewConfiguration.showWaitingMembers {
                    if !party.waitingMembers.isEmpty {
                        Divider()
                            .padding(.vertical, 5)

                        Text("대기중")
                            .font(.pretend(type: .medium, size: 14))
                            .foregroundStyle(Color.gray60)

                        ForEach(party.waitingMembers, id: \.id) {
                            waitingMember in
                            WaitingMemberRow(
                                user: waitingMember,
                                viewModel: viewModel
                            )
                        }
                    }
                }
            }
            .padding(20)
        }
    }

    // MARK: - Divider Section
    private var dividerSection: some View {
        Rectangle()
            .frame(height: 6)
            .foregroundStyle(Color.gray00)
            .padding(.top, 20)
    }
}

// MARK: - Participant Row Component
private struct ParticipantRow: View {
    @ObservedObject var viewModel: PartyDetailViewModel
    let user: User
    let isHost: Bool

    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Text(user.nickName)
                    .font(.pretend(type: .semibold, size: 16))

                if isHost {
                    Image(systemName: "crown")
                        .font(.system(size: 14))
                }
            }
            .foregroundStyle(Color.secondary)

            Spacer()

            if !isHost && viewModel.viewConfiguration.canManageMembers {
                Button {
                    Task {
                        await viewModel.removeMember(user)
                    }
                } label: {
                    Text("내보내기")
                        .font(.pretend(type: .semibold, size: 12))
                        .foregroundStyle(Color.red10)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.red00)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}

// MARK: - Waiting Member Row Component
private struct WaitingMemberRow: View {
    let user: User
    @ObservedObject var viewModel: PartyDetailViewModel

    var body: some View {
        HStack {
            Text(user.nickName)
                .font(.pretend(type: .semibold, size: 16))
                .foregroundStyle(Color.secondary)

            Spacer()

            HStack(spacing: 8) {
                Button {
                    Task {
                        await viewModel.rejectWaitingMember(user)
                    }
                } label: {
                    Text("거절")
                        .font(.pretend(type: .semibold, size: 12))
                        .foregroundStyle(Color.gray60)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.gray10)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                Button {
                    Task {
                        await viewModel.acceptWaitingMember(user)
                    }
                } label: {
                    Text("수락")
                        .font(.pretend(type: .semibold, size: 12))
                        .foregroundStyle(.secondary)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }

    // MARK: - Divider Section
    private var dividerSection: some View {
        Rectangle()
            .frame(height: 6)
            .foregroundStyle(Color.gray00)
            .padding(.top, 20)
    }
}

#Preview {
    PartyDetailParticipantView(
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        ),
        party: Party.sampleData
    )
}
