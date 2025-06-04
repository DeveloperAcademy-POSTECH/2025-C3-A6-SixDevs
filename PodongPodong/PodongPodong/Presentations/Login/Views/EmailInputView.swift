//
//  ContentView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct EmailInputView: View {
    @State var id: String = ""
    var isButtonEnabled: Bool {
        !id.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        VStack(spacing: 60) {
            Text("포스텍 이메일을\n입력해주세요")
                .font(.pretendardBold28)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            TextFieldView(text: $id, placeholder: "아이디", height: 48, suffixText: "@postech.ac.kr")
            
            Spacer()
            Button(action: {
                print("✅ 인증 메일 발송")
            }) {
                ActionButtonView(
                    title: "인증메일 발송하기",
                    isEnabled: isButtonEnabled
                )
            }
            .disabled(!isButtonEnabled)
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
    }
}

#Preview {
    EmailInputView()
}
