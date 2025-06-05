//
//  SearchTextFieldView.swift
//  PodongPodong
//
//  Created by Paidion on 6/4/25.
//

import SwiftUI

struct SearchTextFieldView: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        HStack(spacing: 12) {
            TextField(
                "SearchTextField",
                text: $text,
                prompt: Text(placeholder)
                    .font(.pretendardMedium16)
                    .foregroundColor(.gray50)
            )
            .font(.pretendardSemibold18)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
