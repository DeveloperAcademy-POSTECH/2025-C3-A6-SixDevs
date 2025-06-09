//
//  DescriptionView+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct DescriptionView: View {
        @Binding var description: String
        
        var body : some View{
            VStack{
                Text("설명 (선택)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                Text("이런 내용을 적어보세요\n-가이드라인 1\n-가이드라인2\n-가이드라인3")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .padding(.trailing, 152)
                    .frame(width: 361)
                    .background(Color.gray10)
                    .foregroundColor(Color.gray70)
                    .font(.pretendardMedium16)
                
                
                // TODO: 멀티라인 입력 처리하기
                TextFieldView(
                    text: $description,
                    placeholder: "파티를 어떻게 운영할 것인지에 대한 구체적인 정보를 적어주세요.").frame(width: 361, height: 244)
            }
        }
    }
}

#Preview {
    PartyCreateView()
}
