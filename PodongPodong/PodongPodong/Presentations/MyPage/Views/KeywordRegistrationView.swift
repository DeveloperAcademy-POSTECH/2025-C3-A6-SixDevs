//
//  KeywordRegistrationView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/10/25.
//
// MARK: - 마이페이지 > 알림 > 키워드 알림 View
import SwiftUI

struct KeywordRegistrationView: View {
    var body: some View {
        ZStack {
            Image("KeywordRegistrationViewImage")
                .resizable()
                .scaledToFit()
                .navigationTitle("키워드 등록")
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
        KeywordRegistrationView()
    }
}
