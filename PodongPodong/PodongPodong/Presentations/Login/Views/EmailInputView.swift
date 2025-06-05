//
//  ContentView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct EmailInputView: View {
    @State private var viewModel = LoginViewModel()
    
    var isButtonEnabled: Bool {
        !viewModel.id.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                Text("포스텍 이메일을\n입력해주세요")
                    .font(.pretendardBold28)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                TextFieldView(text: $viewModel.id, placeholder: "아이디", suffixText: "@postech.ac.kr")
                    .frame(width: 361, height: 48)
                
                Spacer()
                
                Button(action: {
                    viewModel.sendEmailAuth()
                }) {
                    ActionButtonView(
                        title: "인증메일 발송하기",
                        isEnabled: isButtonEnabled
                    )
                    .frame(width: 351)
                }
                .disabled(!isButtonEnabled)
                
            }
            .padding(.top, 50)
            .padding(.bottom, 20)
            .navigationDestination(isPresented: $viewModel.isSendEmail) {
                EmailSentView()
            }
        }
    }
}

#Preview {
    EmailInputView()
}
