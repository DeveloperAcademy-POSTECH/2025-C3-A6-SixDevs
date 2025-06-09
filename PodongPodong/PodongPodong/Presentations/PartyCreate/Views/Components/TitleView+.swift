//
//  TitleView+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//


import SwiftUI

extension PartyCreateView {
    struct TitleView: View {
        @Binding var title: String
        
        var body: some View{
            VStack{
                Text("제목")
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                TextFieldView(
                    text: $title,
                    placeholder: "제목을 입력해주세요").frame(width: 361, height: 48)
            }
        }
    }
}
