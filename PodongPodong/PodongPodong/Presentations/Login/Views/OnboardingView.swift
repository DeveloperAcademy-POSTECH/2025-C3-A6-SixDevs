//
//  OnboardingView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/4/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 150) {
                // TODO: - 앱 로고 넣기
                Image(systemName: "globe")
                
                NavigationLink {
                    EmailInputView()
                        .navigationBarBackButtonHidden()
                } label: {
                    ActionButtonView(title: "포스텍 이메일 인증하기", isEnabled: true)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 24)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primaryLight1.ignoresSafeArea())
        }
    }
}

#Preview {
    OnboardingView()
}
