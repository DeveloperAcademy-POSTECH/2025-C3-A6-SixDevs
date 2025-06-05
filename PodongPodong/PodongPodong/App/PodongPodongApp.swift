//
//  PodongPodongApp.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI
import SendbirdSwiftUI
import FirebaseCore


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
    
    init() {
        setupSendbird()
        setupCurrentUser()
    }
    
    var body: some Scene {
        WindowGroup {
//            RootView()
            
            NavigationStack {
                PartyDetailView()
            }
        }
    }
}

private extension PodongPodongApp {
    func setupSendbird() {
        let sendbirdAppId = Bundle.main.sendbirdAppId
        SendbirdUI.initialize(
            applicationId: sendbirdAppId
        ) { params in
            // This is the builder block where you can modify the initParameter.
            //
            // [example]
            // params.needsSynchronous = false
        } startHandler: {
            // Initialization of SendbirdSwiftUI has started.
            // We recommend showing a loading indicator once started.
        } migrationHandler: {
            // DB migration has started.
        } completionHandler: { error in
            // If DB migration is successful, proceed to the next step.
            // If DB migration fails, an error exists.
            // We recommend hiding the loading indicator once done.
        }
    }
    
    func setupCurrentUser() {
        SBUGlobals.currentUser = SBUUser(userId: "rlawlsgur716") // FIXME: - 테스트 계정
        //SBUGlobals.accessToken = "ACCESS_TOKEN"
        SendbirdUI.connect { user, error in
            guard let user = user, error == nil else {
                print("Failed to connect with error: \(error!)")
                return
            }
            print("Successfully connected \(user.userId).")
        }
    }
}
