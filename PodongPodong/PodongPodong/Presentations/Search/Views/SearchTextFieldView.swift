//
//  SearchTextFieldView.swift
//  PodongPodong
//
//  Created by Paidion on 6/4/25.
//

import SwiftUI

struct SearchTextFieldView: View {
    @Binding var text: String
    @State var textFieldText: String = ""
    let placeholder: String
    @FocusState var isFocused
    
    var body: some View {
        HStack(spacing: 12) {
            TextField(
                "SearchTextField",
                text: $textFieldText,
                prompt: Text(placeholder)
                    .font(.pretendardMedium16)
                    .foregroundColor(.gray50)
            )
            .font(.pretendardSemibold18)
            .foregroundColor(.black)
            .submitLabel(.search)
            .autocorrectionDisabled()
            .focused($isFocused)
            .onSubmit {
                text = textFieldText
            }
            
            if !textFieldText.isEmpty {
                Button(action: {
                    textFieldText = ""
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.gray10)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray10, lineWidth: 1)
        )
        .cornerRadius(8)
    }
}


#Preview {
    SearchTextFieldView(
        text: .constant(""),
        placeholder: "검색어를 입력해주세요"
    )
    .frame(width: 361, height: 50)
}
