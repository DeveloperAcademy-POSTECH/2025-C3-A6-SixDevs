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
    
    var id: String = ""
    var inputEmail: String = ""
    
    // MARK: - 현재 로그인 유저 이메일 조회
    var currentEmail: String {
        guard let currentUserEmail = Auth.auth().currentUser?.email else { return "" }
        
        return currentUserEmail
    }
    
    // MARK: - 현재 로그인 유저 로그아웃
    func currentUserSignOut() async throws {
        try Auth.auth().signOut()
    }
    
    
    // MARK: - 이메일 전송
    func sendSignInLink(to email: String) async throws {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://podongpodong-696db.web.app/index.html")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier ?? "")
        
        try await Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings)
    }
    
    
    // MARK: - 딥 링크 로그인 인증 로직
    func handleEmailSignInLink(url: URL, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        guard url.scheme == "podongpodong",
              url.host == "email-verified",
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems,
              let oobCode = queryItems.first(where: { $0.name == "oobCode" })?.value,
              let mode = queryItems.first(where: { $0.name == "mode" })?.value,
              mode == "signIn"
                
        else {
            completion(.failure(AuthError.invalidLink))
            return
        }
        
        
        var signInLink = "https://podongpodong-696db.web.app/?oobCode=\(oobCode)&mode=signIn"
        
        
        if let apiKey = queryItems.first(where: { $0.name == "apiKey" })?.value {
            signInLink += "&apiKey=\(apiKey)"
        }
        
        if let continueUrl = queryItems.first(where: { $0.name == "continueUrl" })?.value {
            signInLink += "&continueUrl=\(continueUrl)"
        }
        
        
        Auth.auth().signIn(withEmail: inputEmail, link: signInLink) { authResult, error in
            if let error = error {
                completion(.failure(AuthError.firebaseError(error)))
            }
            else if let authResult = authResult {
                let isNewUser = authResult.additionalUserInfo?.isNewUser ?? false
                completion(.success(isNewUser))
            }
            else {
                completion(.failure(AuthError.unknown))
            }
        }
    }
}



