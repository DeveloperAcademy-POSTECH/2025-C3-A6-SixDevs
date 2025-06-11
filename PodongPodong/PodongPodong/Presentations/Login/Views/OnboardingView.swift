//
//  OnboardingView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/4/25.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var router: AuthNavigationRouter = .init()
    
    var body: some View {
        NavigationStack(path: $router.destination) {
            VStack(spacing: 150) {
                Image("AppLogo")
                    .resizable()
                    .frame(width: 146, height: 146)
                    .clipShape(Circle())
                Button {
                    router.push(to: .emailInput)
                } label: {
                    ActionButtonView(title: "포스텍 이메일 인증하기", isEnabled: true)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 24)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primaryLight1.ignoresSafeArea())
            .navigationDestination(for: AuthNavigationDestination.self) { route in
                switch route {
                case .emailInput:
                    EmailInputView()
                        .hideBackButton()
                case .emailSent:
                    EmailSentView()
                        .hideBackButton()
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    OnboardingView()
}
