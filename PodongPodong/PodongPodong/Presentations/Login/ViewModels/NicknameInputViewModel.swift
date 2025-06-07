//
//  NicknameInputViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/8/25.
//

import Foundation

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
    
    // Firestore에 계정 생성
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
    
}
