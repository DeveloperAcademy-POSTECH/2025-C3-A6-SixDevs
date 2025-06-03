//
//  OnboardingView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/4/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Color.primaryLight1
                .ignoresSafeArea()
            NavigationStack {
                VStack(spacing: 150) {
                    // TODO: - 앱 로고 넣기
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    NavigationLink(destination: EmailInputView()) {
                        ActionButtonView(title: "포스텍 이메일 인증하기", isEnabled: true)
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
