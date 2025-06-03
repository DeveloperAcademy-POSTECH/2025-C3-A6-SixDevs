//
//  CommentView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import SwiftUI

struct CommentView: View {
    let userName: String
    let commentText: String
    let createdAt: String
    
    init(userName: String, commentText: String, createdAt: String) {
        self.userName = userName
        self.commentText = commentText
        self.createdAt = createdAt
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 17) {
            
            
            HStack {
                // 이미지 추가 전 임시 프로필
                Circle()
                    .frame(width: 28, height: 28)
                    .foregroundStyle(.main)
                Text(userName)
                    .font(.pretend(type: .semibold, size: 15))
                    .foregroundStyle(.second)
                Spacer()
                Text(createdAt)
                    .font(.pretend(type: .medium, size: 12))
                    .foregroundStyle(.gray60)
            }
            Text(commentText)
                .font(.pretend(type: .medium, size: 16))
                .padding(.leading, 36)
            
        }
    }
}

#Preview {
    CommentView(userName: "삼겹살만취급함", commentText: "상처투성이의 손을 맞잡고 다시 비틀비틀 짝짜꿍", createdAt: "2일전")
}
