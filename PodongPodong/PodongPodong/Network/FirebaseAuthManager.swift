//
//  FirebaseAuthManager.swift
//  PodongPodong
//
//  Created by 김민석 on 6/4/25.
//

import Foundation
import FirebaseAuth

/// Firebase Auth 호출을 한 곳에 모아두는 싱글톤 매니저
final class FirebaseAuthManager {
    static let shared = FirebaseAuthManager()
    private init() {}
    
    func sendSignInLink(to email: String) async throws -> Bool {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.url = URL(string: "https://podongpodong-696db.firebaseapp.com/?email=\(email)")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        
        try await Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings)
        
        return true
    }
}
