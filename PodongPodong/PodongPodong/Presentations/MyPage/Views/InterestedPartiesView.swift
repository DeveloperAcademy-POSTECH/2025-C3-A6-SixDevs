//
//  InterestedPartiesView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/9/25.
//
// MARK: - 마이페이지 > 관심 파티 목록 View
import SwiftUI

struct InterestedPartiesView: View {
    var body: some View {
        ZStack {
            Image("InterestedPartiesViewImage")
                .resizable()
                .scaledToFit()
                .navigationTitle("관심 파티 목록")
                .navigationBarTitleDisplayMode(.inline)
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
        InterestedPartiesView()
    }
}
