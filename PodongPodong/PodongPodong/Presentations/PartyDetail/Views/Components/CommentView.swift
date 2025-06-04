//
//  CommentView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import SwiftUI

struct CommentView: View {
    let comments: [PartyComment]

    init(comments: [PartyComment]) {
        self.comments = comments
    }

    var body: some View {
        ForEach(comments, id: \.id) { comment in
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    // 이미지 추가 전 임시 프로필
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundStyle(.main)
                    Text(comment.user.nickName)
                        .font(.pretend(type: .semibold, size: 15))
                        .foregroundStyle(.second)
                    Spacer()
                    Text(comment.createdAt.formattedMonthDay)
                        .font(.pretend(type: .medium, size: 12))
                        .foregroundStyle(.gray60)
                }
                Text(comment.content)
                    .font(.pretend(type: .medium, size: 16))
                    .padding(.leading, 36)
            }
        }
    }
}

#Preview {
    CommentView(comments: Array(PartyComment.sampleComments[0...2]))
}
