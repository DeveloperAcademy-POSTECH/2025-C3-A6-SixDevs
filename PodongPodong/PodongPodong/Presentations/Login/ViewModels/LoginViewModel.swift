//
//  LoginViewModel.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation
import Observation

@Observable
final class LoginViewModel {
    var id: String = ""
    let email: String = "@postech.ac.kr"
    
    var isLoading: Bool = false
    var errorMessage: String? = nil
    var isSendEmail: Bool = false
    
    func sendEmailAuth() {
        Task {
            isLoading = true
            do {
                try await FirebaseAuthManager.shared.sendSignInLink(to: id+email)
            } catch {
                errorMessage = error.localizedDescription
                print(errorMessage ?? "")
            }
            
            isLoading = false
            isSendEmail = true
        }
    }
}
