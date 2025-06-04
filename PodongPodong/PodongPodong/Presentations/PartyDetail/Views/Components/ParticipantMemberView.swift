//
//  ParticipantMemberView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import Foundation
import SwiftUI

struct ParticipantMemberView: View {
    let host: User
    var members: [User]
    var waitingMembers: [User]

    init(host: User, members: [User], waitingMembers: [User]) {
        self.host = host
        self.members = members
        self.waitingMembers = waitingMembers
    }

    var body: some View {
        ZStack {
            Color(.participantMemberBackground)
            VStack(alignment: .leading, spacing: 35) {
                HStack {
                    Text(host.nickName)
                    Image(systemName: "crown")
                }
                .font(.pretend(type: .semibold, size: 16))
                .foregroundStyle(.second)

                ForEach(members, id: \.id) { member in
                    HStack {
                        Text(member.nickName)
                            .foregroundStyle(.second)
                            .font(.pretend(type: .semibold, size: 16))
                        Spacer()
                        Text("내보내기")
                            .foregroundStyle(Color.red10)
                            .font(.pretend(type: .semibold, size: 12))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.red00)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                ForEach(waitingMembers, id: \.id) { waitingMember in
                    HStack {
                        Text(waitingMember.nickName)
                            .foregroundStyle(.second)
                            .font(.pretend(type: .semibold, size: 16))
                        Spacer()
                        Text("거절")
                            .foregroundStyle(Color.gray60)
                            .font(.pretend(type: .semibold, size: 12))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.gray10)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                        Text("수락")
                            .foregroundStyle(.second)
                            .font(.pretend(type: .semibold, size: 12))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(.main)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .padding()
        }
    }

}

#Preview {
    ParticipantMemberView(
        host: User.sampleUsers[0],
        members: Array(User.sampleUsers[1...2]),
        waitingMembers: Array(User.sampleUsers[2...4])
    )
}
