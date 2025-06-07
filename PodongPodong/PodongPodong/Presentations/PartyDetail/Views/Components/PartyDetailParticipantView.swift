//
//  PartyDetailParticipantView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/5/25.
//

import SwiftUI

struct PartyDetailParticipantView: View {
    let party: Party
    let currentUser: User
    @ObservedObject var viewModel: PartyDetailViewModel

    var body: some View {
        VStack {
            headerSection
            ParticipantMemberView(
                party: party,
                currentUser: currentUser,
                viewModel: viewModel
            )
            dividerSection
        }
    }

    // MARK: - Header Section
    private var headerSection: some View {
        HStack {
            Text("참여 인원(\(party.member.count + 1))")  // 초기 인원(파티장) 세팅
                .foregroundStyle(Color.secondary)
                .font(.pretend(type: .bold, size: 16))

            Spacer()

            Button {
                // 채팅방으로 이동
            } label: {
                Text("채팅방")
                Image(systemName: "chevron.right")
            }
            .font(.pretend(type: .semibold, size: 14))
            .foregroundStyle(Color.secondary)
        }
    }

    // MARK: - Participant Member View
    struct ParticipantMemberView: View {
        let party: Party
        let currentUser: User
        @ObservedObject var viewModel: PartyDetailViewModel

        var body: some View {
            ZStack {
                Color(Color.gray00)
                VStack(alignment: .leading, spacing: 35) {
                    hostSection
                    memberSection
                    if viewModel.isHost {
                        waitingmemberSection
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 22)
            }
        }

        // MARK: - Host Section
        private var hostSection: some View {
            HStack {
                Text(party.writen.nickName)
                Image(systemName: "crown")
                Spacer()
            }
            .font(.pretend(type: .semibold, size: 16))
            .foregroundStyle(Color.secondary)
        }

        // MARK: - Member Section
        private var memberSection: some View {
            ForEach(party.member, id: \.id) { member in
                HStack {
                    Text(member.nickName)
                        .foregroundStyle(Color.secondary)
                        .font(.pretend(type: .semibold, size: 16))
                    Spacer()

                    if viewModel.isHost {
                        removeMemberButton(for: member)
                    }
                }
            }
        }

        // MARK: - Waiting Member Section
        private var waitingmemberSection: some View {
            ForEach(party.waitingMembers, id: \.id) { waitingMember in

                HStack {
                    Text(waitingMember.nickName)
                        .foregroundStyle(Color.secondary)
                        .font(.pretend(type: .semibold, size: 16))
                    Spacer()

                    waitingMemberButtons(for: waitingMember)
                }
            }

        }

        // MARK: - Button Components
        private func removeMemberButton(for member: User) -> some View {
            Button {
                Task {
                    await viewModel.removeMember(member)
                }
            } label: {
                Text("내보내기")
                    .foregroundStyle(Color.red10)
                    .font(.pretend(type: .semibold, size: 12))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color.red00)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

        }

        private func waitingMemberButtons(for waitingMember: User) -> some View
        {
            HStack {
                Button {
                    Task {
                        await viewModel.rejectWaitingMember(waitingMember)
                    }
                } label: {
                    Text("거절")
                        .foregroundStyle(Color.gray60)
                        .font(.pretend(type: .semibold, size: 12))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.gray10)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                Button {
                    Task {
                        await viewModel.acceptWaitingMember(waitingMember)
                    }
                } label: {
                    Text("수락")
                        .foregroundStyle(Color.secondary)
                        .font(.pretend(type: .semibold, size: 12))
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
        party: Party.sampleData,
        currentUser: User.sampleCurrentUser,
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        )
    )
}
