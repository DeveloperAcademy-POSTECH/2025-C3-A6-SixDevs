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

    var body: some View {
        VStack {
            headerSection
            participantMemberView
            dividerSection
        }
    }

    // MARK: - Header Section
    private var headerSection: some View {
        HStack {
            Text("참여 인원(\(party.member.count))")
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
    private var participantMemberView: some View {
        EnhancedParticipantMemberView(
            host: party.writen.nickName,
            members: party.member.map { $0.nickName },
            waitingMembers: party.waitingMembers.map { $0.nickName },
            isHost: party.writen.id == currentUser.id
        )
    }

    // MARK: - Divider Section
    private var dividerSection: some View {
        Rectangle()
            .frame(height: 6)
            .foregroundStyle(Color.gray00)
            .padding(.top, 20)
    }
}

struct EnhancedParticipantMemberView: View {
    let host: String
    var members: [String]
    var waitingMembers: [String]
    let isHost: Bool

    var body: some View {
        ZStack {
            Color(Color.gray00)
            VStack(alignment: .leading, spacing: 35) {
                hostSection
                memberSection
                waitingmemberSection
            }
            .padding()
        }
    }

    // MARK: - Host Section
    private var hostSection: some View {
        HStack {
            Text(host)
            Image(systemName: "crown")
            Spacer()
        }
        .font(.pretend(type: .semibold, size: 16))
        .foregroundStyle(Color.secondary)
    }

    // MARK: - Member Section
    private var memberSection: some View {
        ForEach(members, id: \.self) { member in
            HStack {
                Text(member)
                    .foregroundStyle(Color.secondary)
                    .font(.pretend(type: .semibold, size: 16))
                Spacer()

                if isHost {
                    removeMemberButton(for: member)
                }
            }
        }
    }

    // MARK: - Waiting Member Section
    private var waitingmemberSection: some View {
        ForEach(waitingMembers, id: \.self) { waitingMember in
            HStack {
                Text(waitingMember)
                    .foregroundStyle(Color.secondary)
                    .font(.pretend(type: .semibold, size: 16))
                Spacer()

                if isHost {
                    waitingMemberButtons(for: waitingMember)
                }
            }
        }
    }

    // MARK: - Button Components
    private func removeMemberButton(for member: String) -> some View {
        Button {
            // 멤버 삭제하기
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

    private func waitingMemberButtons(for waitingMember: String) -> some View {
        HStack {
            Button {
                // 멤버 거절
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
                // 멤버 수락하기
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

#Preview {
    PartyDetailParticipantView(
        party: Party.sampleData,
        currentUser: User.sampleCurrentUser
    )
}
