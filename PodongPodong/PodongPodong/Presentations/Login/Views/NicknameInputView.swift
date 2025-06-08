//
//  NicknameInputView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/8/25.
//

import SwiftUI

struct NicknameInputView: View {
    @State private var viewModel: NicknameInputViewModel = .init()
    @State private var showHome = false
    
    let id: String = FirebaseAuthManager.shared.id
    
    var onComplete: (() -> ())? = nil
    
    var body: some View {
        VStack(spacing: 60) {
            Text("사용할 닉네임을\n입력해주세요")
                .font(.pretendardBold28)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            VStack(alignment: .trailing, spacing: 4) {
                TextFieldView(text: $viewModel.nickName, placeholder: "닉네임을 입력해주세요")
                    .frame(width: 361, height: 48)
                    .onChange(of: viewModel.nickName) {
                        viewModel.onNickNameChanged(viewModel.nickName)
                    }
                Text("\(viewModel.nickName.count) / \(viewModel.maxLength)")
                    .font(.pretendardSemibold14)
                    .foregroundStyle(Color.gray60)
                    .offset(x: -7)
            }
            
            Spacer()
            
            Button(action: {
                Task {
                    async let createResult: () = await viewModel.createFirebaseUser(email: id)
                    async let updateResult: () = SendbirdManager.shared.setupCreateUser(nickname: viewModel.nickName, email: id)
                    
                    _ = await (createResult, updateResult)
                    
                    viewModel.saveUserID()
                    onComplete?()
                }
            }) {
                ActionButtonView(
                    title: "시작하기",
                    isEnabled: viewModel.nickName.count >= 1
                )
                .frame(width: 351)
            }
            .disabled(viewModel.nickName.count < 1)
        }
        .onTapGesture {
            hideKeyboard()
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
    }
}

#Preview {
    NicknameInputView()
}
