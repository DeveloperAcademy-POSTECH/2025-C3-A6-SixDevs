//
//  PartyDetailCommentView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/5/25.
//

import SwiftUI

struct PartyDetailCommentView: View {
    @ObservedObject var viewModel: PartyDetailViewModel

    let party: Party

    var body: some View {
        VStack(spacing: 23) {
            headerSection
            CommentView(comments: party.comments)
        }
    }

    // MARK: - Header Section
    private var headerSection: some View {
        HStack {
            Text("댓글(\(viewModel.commentCount))")
                .foregroundStyle(Color.secondary)
                .font(.pretend(type: .bold, size: 16))
            Spacer()

            NavigationLink(
                destination: PartyDetailFullCommentView(
                    viewModel: viewModel,
                    party: party
                )
            ) {
                HStack {
                    Text("전체보기")
                    Image(systemName: "chevron.right")
                }
                .font(.pretend(type: .semibold, size: 14))
                .foregroundStyle(Color.secondary)
            }
        }
    }
}

// MARK: - Comment Section
struct CommentView: View {
    let comments: [PartyComment]

    var body: some View {
        ForEach(comments, id: \.id) { comment in
            VStack(alignment: .leading, spacing: 17) {
                HStack {
                    // 이미지 추가 전 임시 프로필
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundStyle(Color.primaryColor)
                    Text(comment.user.nickName)
                        .font(.pretend(type: .semibold, size: 15))
                        .foregroundStyle(Color.secondary)
                    Spacer()
                    Text(comment.createdAt.formattedMonthDay)
                        .font(.pretend(type: .medium, size: 12))
                        .foregroundStyle(Color.gray60)
                }
                Text(comment.content)
                    .font(.pretend(type: .medium, size: 16))
                    .padding(.leading, 36)
                    .padding(.top, -12)
            }
        }
    }
}

#Preview {
    PartyDetailCommentView(
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        ),
        party: Party.sampleData
    )
}
