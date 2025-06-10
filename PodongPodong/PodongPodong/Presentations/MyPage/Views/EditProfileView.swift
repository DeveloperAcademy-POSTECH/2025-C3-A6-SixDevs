//
//  EditProfileView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/10/25.
//

// MARK: - 마이페이지 > 프로필 수정 버튼 View

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Image("EditProfileViewImage")
                .resizable()
                .scaledToFit()
                .navigationTitle("프로필 수정")
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
        EditProfileView()
    }
}
