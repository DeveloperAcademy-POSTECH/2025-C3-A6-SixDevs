//
//  ParticipantMemberView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import Foundation
import SwiftUI

struct ParticipantMemberView: View {
    let host: String
    var members: [String]
    var waitingMembers: [String]
    
    init(host: String, members: [String], waitingMembers: [String]) {
        self.host = host
        self.members = members
        self.waitingMembers = waitingMembers
    }
    
    var body: some View {
        ZStack {
            Color(.participantMemberBackground)
            VStack(alignment: .leading, spacing: 35) {
                HStack {
                    Text(host)
                    Image(systemName: "crown")
                }
                .font(.pretend(type: .semibold, size: 16))
                .foregroundStyle(.second)
                
                ForEach(members, id: \.self) { member in
                    HStack {
                        Text(member)
                            .foregroundStyle(.second)
                            .font(.pretend(type: .semibold, size: 16))
                        Spacer()
                        Text("내보내기")
                            .foregroundStyle(.second)
                            .font(.pretend(type: .semibold, size: 12))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1)
                                    .foregroundStyle(.white)
                            }
                    }
                }
                
                ForEach(waitingMembers, id: \.self) { waitingMember in
                    HStack {
                        Text(waitingMember)
                            .foregroundStyle(.second)
                            .font(.pretend(type: .semibold, size: 16))
                        Spacer()
                        Text("거절")
                            .foregroundStyle(.second)
                            .opacity(0.8)
                            .font(.pretend(type: .semibold, size: 12))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1)
                                    .foregroundStyle(.white)
                            }
                        
                        
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
    ParticipantMemberView(host: "삼겹살만취급함", members: ["쇼핑중독", "뚠뚠"], waitingMembers: ["파덕", "매일연어만먹음"])
}
