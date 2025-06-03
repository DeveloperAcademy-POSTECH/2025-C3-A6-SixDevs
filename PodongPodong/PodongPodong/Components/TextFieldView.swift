//
//  TextFieldView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/3/25.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    var placeholder: String = "정보를 입력해주세요"
    var suffixText: String? = nil
    var icon: Image? = nil
    let height: CGFloat

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
        .frame(width: 361, height: height)
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
        height: 44
    )
    
    TextFieldView(
        text: .constant(""),
        placeholder: "링크를 입력해주세요",
        height: 44
    )
    
    TextFieldView(
        text: .constant(""),
        placeholder: "날짜를 입력해주세요",
        icon: Image(systemName: "calendar"),
        height: 44
    )
    
    TextFieldView(
        text: .constant(""),
        placeholder: "이메일을 입력해주세요",
        suffixText: "@postech.ac.kr",
        height: 44
    )
    
    TextFieldView(
        text: .constant(""),
        placeholder: "개수를 입력해주세요",
        suffixText: "g",
        height: 44
    )
}
