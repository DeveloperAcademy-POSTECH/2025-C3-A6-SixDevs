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
            RootView()
        }
    }
}

private extension PodongPodongApp {
    func setupSendbird() {
        let APP_ID = "APP_ID"    // Specify your Sendbird application ID.
        
        SendbirdUI.initialize(
            applicationId: APP_ID
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
        // Set current user.
        SBUGlobals.currentUser = SBUUser(userId: "USER_ID")
        SBUGlobals.accessToken = "ACCESS_TOKEN"
    }
}
