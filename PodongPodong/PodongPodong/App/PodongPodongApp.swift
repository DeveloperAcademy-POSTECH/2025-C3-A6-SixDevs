//
//  PodongPodongApp.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct PodongPodongApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var appScreen: AppScreen = .onboarding // TODO: 키체인 여부에 따라 초기 상태 변경하기, 이메일 재발송 로직, 텍스트 필드 화면 터치 시 키보드 창 내리기
    
    init() {
        SendbirdManager.shared.setupSendbird()
        // TODO: 키체인에 등록된 id(이메일)가 있다면 여기서 init setupCurrentUser() 시간나면 라우터 합쳐보기
        // setupCurrentUser()
    }
    
    // 닉네임 뷰
    // 1. 닉네임을 입력받고, 그 정보를
    // 2. 파이어베이스, Sendbird에 각각 등록해야 함.
    // 3. 키체인까지... (자동 로그인)
    
    var body: some Scene {
        WindowGroup {
            switch appScreen {
            case .onboarding:
                OnboardingView()
                    .onOpenURL { url in
                        FirebaseAuthManager.shared.handleEmailSignInLink(url: url) { result in
                            switch result {
                            case .success(let isNewUser):
                                if isNewUser { // 신규 유저
                                    appScreen = .nicknameInput
                                }
                                else { // 기존 유저
                                    appScreen = .home
                                }
                            case .failure(let error):
                                print("error: \(error.localizedDescription)")
                            }
                        }
                    }
            case .nicknameInput:
                NicknameInputView() {
                    appScreen = .home
                }
            case .home:
                RootView()
            }
        }
    }
}

// FIXME: - 위치 옮기기
enum AppScreen {
    case onboarding
    case nicknameInput
    case home
}
