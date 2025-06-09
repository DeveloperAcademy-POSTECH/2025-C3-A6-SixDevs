//
//  SendbirdManager.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/8/25.
//

import Foundation
import SendbirdSwiftUI
import SendbirdChatSDK

final class SendbirdManager {
    static let shared = SendbirdManager()
    private init() {}
    
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

    func setupCurrentUser(email: String) {
        SBUGlobals.currentUser = SBUUser(userId: email) // FIXME: - rlawlsgur716 테스트 계정 (키 체인 로직으로 수정) => 파라미터로 받는게 좋을뜻
        //SBUGlobals.accessToken = "ACCESS_TOKEN"
        SendbirdUI.connect { user, error in
            guard let user = user, error == nil else {
                print("Failed to connect with error: \(error!)")
                return
            }
            print("Successfully connected \(user.userId).")
        }
    }
    
    
    func setupCreateUser(nickname: String, email: String) {
        SBUGlobals.currentUser = SBUUser(userId: email)
        SendbirdUI.connect { user, error in
            if let error = error {
                print("Failed to connect with error: \(error.localizedDescription)")
                return
            }
            print("Successfully connected \(user?.userId ?? "")")
            let params = UserUpdateParams()
            params.nickname = nickname
            SendbirdChat.updateCurrentUserInfo(params: params, completionHandler:  { error in
                if let error = error {
                    print("닉네임 변경 실패: \(error.localizedDescription)")
                } else {
                    print("닉네임이 성공적으로 변경되었습니다.")
                }
            })
        }
    }
    
}
