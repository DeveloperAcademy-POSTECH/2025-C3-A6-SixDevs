//
//  PartyDetailBottomView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/5/25.
//

import SwiftUI

struct PartyDetailBottomView: View {
    let party: Party
    let currentUser: User

    var body: some View {
        HStack {
            likeButton
            actionButton
        }
        .padding(.top, 30)
    }

    //MARK: - Like Button
    private var likeButton: some View {
        Button {
            // 좋아요 버튼
        } label: {
            Image(systemName: "heart")
                .font(.system(size: 36, weight: .regular))
                .foregroundStyle(.black)
        }
    }

    //MARK: - Action Button
    private var actionButton: some View {
        Button {
            // 파티 참여/마감
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .fill(.main)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .overlay {
                    Text(buttonTitle)
                        .font(.pretend(type: .semibold, size: 18))
                        .foregroundStyle(Color.second)
                }
        }
    }

    //MARK: - Helper Properties
    private var isHost: Bool {
        party.writen.id == currentUser.id
    }

    private var buttonTitle: String {
        // 참여중, 참여 신청중, 파티 종료하기 상태 추가
        if isHost {
            return "파티 마감하기"
        } else {
            return "파티 참여하기"
        }
    }
}

#Preview {
    PartyDetailBottomView(
        party: Party.sampleData,
        currentUser: User.sampleCurrentUser
    )
}
