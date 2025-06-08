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
    
    
    @State private var appScreen: AppScreen = {
        if let _ = KeychainManager.shared.load(account: KeychainAccount.userID.rawValue, service: Bundle.identifier) {
            return .home
        } else {
            return .onboarding
        }
    }()
    
    
    init() {
        SendbirdManager.shared.setupSendbird()
        if let userID = KeychainManager.shared.load(account: KeychainAccount.userID.rawValue, service: Bundle.identifier) {
            print("userID : \(userID)")
            SendbirdManager.shared.setupCurrentUser(email: userID)
        }
    }
    
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
                                    KeychainManager.shared.saveIdToKeychain(
                                        account: KeychainAccount.userID.rawValue,
                                        service: Bundle.identifier,
                                        id: FirebaseAuthManager.shared.id
                                    )
                                    SendbirdManager.shared.setupCurrentUser(email: FirebaseAuthManager.shared.id)
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
