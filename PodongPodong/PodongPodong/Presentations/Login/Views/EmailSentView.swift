//
//  EmailSentView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/4/25.
//

import SwiftUI

struct EmailSentView: View {
    var body: some View {
        VStack(spacing: 40) {
            // 1) 최상단부터 이미지, 텍스트, 버튼이 붙도록
            Image(.emailCheck)
                .resizable()
                .frame(width: 135, height: 135)
            
            Text("""
                메일을 발송했어요

                메일함에 들어가서 확인 링크를 눌러
                회원가입을 마무리해주세요.
                """)
                .font(.pretendardMedium18)
                .lineSpacing(8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            Button {
                // TODO: 재발송 로직 넣기
            } label: {
                ActionButtonView(
                    title: "인증메일 재발송하기",
                    isEnabled: true
                )
                .frame(width: 351)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    EmailSentView()
}
