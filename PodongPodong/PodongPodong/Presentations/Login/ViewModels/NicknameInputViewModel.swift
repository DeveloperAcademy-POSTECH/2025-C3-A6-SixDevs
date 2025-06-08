//
//  NicknameInputViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/8/25.
//

import SwiftUI

@Observable
final class NicknameInputViewModel {
    var nickName: String = ""
    let maxLength = 8
    
    func onNickNameChanged(_ newValue: String) {
        if newValue.count > maxLength {
            nickName = String(newValue.prefix(maxLength))
        } else {
            nickName = newValue
        }
    }
    
    // MARK: - 파이어베이스 유저 생성
    func createFirebaseUser(email: String) async {
        let user = User(
            email: email,
            nickName: nickName,
            profileImage: .image1,
            reviewRating: 0.0
        )
        do {
            let savedUser = try await FirestoreManager.shared.create(user)
            print(savedUser)
        } catch {
            print("error : \(error.localizedDescription)")
        }
        
    }
    
    // MARK: -  키체인 유저 정보 저장 (이 부분이 기존 유저도 있어야함.)
    func saveUserID() {
        KeychainManager.shared.saveIdToKeychain(
            account: KeychainAccount.userID.rawValue,
            service: Bundle.identifier,
            id: FirebaseAuthManager.shared.id
        )
    }
    
}
