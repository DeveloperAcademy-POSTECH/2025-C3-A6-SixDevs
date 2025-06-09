//
//  RecruitmentCountView+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct RecruitmentCountView: View {
        @Binding var recruitmentCount: Int
        
        let minCount=2
        let maxCount=8
        
        var body: some View{
            VStack{
                Text("모집 인원")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                HStack(spacing: 12){
                    Button(action: {if recruitmentCount > minCount{recruitmentCount -= 1}}){
                        Text("-")
                            .foregroundColor(recruitmentCount > minCount ? .black : Color.gray50)
                            
                    }
                    .padding(.leading, 12)
                    .frame(width : 42, height: 36, alignment: .center)
                    .font(Font.custom("Pretendard", size: 30))
                    
                    Text("\(recruitmentCount)명")
                        .font(.pretendardLight14)
                        .frame(width: 58, height: 36, alignment: .center)
                        .background(.white)
                        .overlay(
                            Rectangle()
                                .inset(by: 0.5)
                                .stroke(Color.gray50, lineWidth:1)
                        )
                    Button(action: {if recruitmentCount < maxCount{recruitmentCount += 1}}){
                        Text("+")
                            .foregroundStyle(recruitmentCount < maxCount ? .black : Color.gray50)
                    }
                    .padding(.trailing, 12)
                    .frame(width : 42, height: 36, alignment: .center)
                    .font(Font.custom("Pretendard", size: 30))
                }
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray50, lineWidth: 2))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
            }
        }
    }
}
