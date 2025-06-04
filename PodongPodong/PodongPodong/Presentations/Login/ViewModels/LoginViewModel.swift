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
    var email: String = "@postech.ac.kr"
    
    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String? = nil
    private(set) var isSendEmail: Bool = false
    
    func sendEmailAuth() {
        Task {
            isLoading = true
            do {
                try await FirebaseAuthManager.shared.sendSignInLink(to: id+email)
            } catch {
                errorMessage = error.localizedDescription
            }
            
            isLoading = false
            isSendEmail = true
        }
    }
}
