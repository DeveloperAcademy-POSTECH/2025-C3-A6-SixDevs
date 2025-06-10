//
//  ParticipatedView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/9/25.
//

// MARK: - 마이페이지> 참여한 파티 View
import SwiftUI

struct ParticipatedView: View {
    var body: some View {
        ZStack {
            Image("ParticipatedViewImage")
                .resizable()
                .scaledToFit()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                
                Button {
//                    router.pop()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                        .frame(width: 36, height: 36)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ParticipatedView()
    }
}
