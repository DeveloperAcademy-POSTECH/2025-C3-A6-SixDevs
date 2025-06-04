//
//  TextFieldView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/3/25.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    let placeholder: String
    private(set) var suffixText: String? = nil
    private(set) var icon: Image? = nil

    var body: some View {
        HStack(spacing: 12) {
            if let icon = icon {
                icon
                    .resizable()
                    .foregroundColor(.gray60)
                    .frame(width: 22, height: 22)
            }

            TextField(
                "TextField",
                text: $text,
                prompt: Text(placeholder)
                    .font(.pretendardMedium16)
                    .foregroundColor(.gray60)
            )
            .font(.pretendardSemibold18)
            .foregroundColor(.black)

            if let suffix = suffixText {
                Text(suffix)
                    .font(.pretendardSemibold16)
                    .foregroundColor(.gray70)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray50, lineWidth: 1)
        )
        .cornerRadius(8)
    }
}

#Preview {
    TextFieldView(
        text: .constant(""),
        placeholder: "정보를 입력해주세요",
    ).frame(width: 361, height: 100)
    
    TextFieldView(
        text: .constant(""),
        placeholder: "링크를 입력해주세요",
    ).frame(width: 160, height: 44)
    
    TextFieldView(
        text: .constant(""),
        placeholder: "날짜를 입력해주세요",
        icon: Image(systemName: "calendar")
    ).frame(width: 361, height: 44)
    
    TextFieldView(
        text: .constant(""),
        placeholder: "이메일을 입력해주세요",
        suffixText: "@postech.ac.kr"
    ).frame(width: 361, height: 48)
    
    TextFieldView(
        text: .constant(""),
        placeholder: "개수를 입력해주세요",
        suffixText: "g"
    ).frame(width: 361, height: 48)
}
