//
//  SearchHeaderView.swift
//  PodongPodong
//
//  Created by Paidion on 6/6/25.
//

import SwiftUI

struct SearchHeaderView: View {
    @Binding var text: String
    @FocusState var isFocused
    
    var body: some View {
        HStack(spacing: 12) {
//            Button {
//                // TODO: 내비게이션 처리
//                print("이전 화면으로 이동하기")
//            } label: {
//                Image(systemName: "chevron.left")
//                    .foregroundStyle(.black)
//            }
            SearchTextFieldView(
                text: $text,
                placeholder: "검색어를 입력해주세요"
            ).focused($isFocused)
        }
        .padding(.horizontal)
    }
}


#Preview {
    @Previewable @State var text = "가나다라마바사"
    
    SearchHeaderView(text: $text)
}
