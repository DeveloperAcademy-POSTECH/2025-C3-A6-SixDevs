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
        var canEdit: Bool = true
        var restrictionMessage: String? = nil

        let minCount = 2
        let maxCount = 8

        var body: some View {
            VStack {
                Text("모집 인원")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium14)
                    .foregroundColor(.gray60)
                    .padding(.bottom, 8)

                if let message = restrictionMessage {
                    Text(message)
                        .font(.pretend(type: .light, size: 12))
                        .foregroundColor(.orange)
                        .padding(.horizontal, 16)
                }

                HStack(spacing: 12) {
                    Button(action: {
                        if canEdit && recruitmentCount > minCount { recruitmentCount -= 1 }
                    }) {
                        Text("-")
                            .foregroundColor(
                                recruitmentCount > minCount
                                    ? .black : Color.gray50
                            )

                    }
                    .padding(.leading, 12)
                    .frame(width: 42, height: 36, alignment: .center)
                    .font(Font.custom("Pretendard", size: 30))

                    Text("\(recruitmentCount)명")
                        .font(.pretendardLight14)
                        .frame(width: 58, height: 36, alignment: .center)
                        .background(.white)
                        .overlay(
                            Rectangle()
                                .inset(by: 0.5)
                                .stroke(Color.gray50, lineWidth: 1)
                        )
                    Button(action: {
                        if canEdit && recruitmentCount < maxCount { recruitmentCount += 1 }
                    }) {
                        Text("+")
                            .foregroundStyle(
                                recruitmentCount < maxCount
                                    ? .black : Color.gray50
                            )
                    }
                    .disabled(!canEdit)
                    .padding(.trailing, 12)
                    .frame(width: 42, height: 36, alignment: .center)
                    .font(Font.custom("Pretendard", size: 30))
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(canEdit ? Color.gray50 : Color.gray30, lineWidth: 2)
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
            }
        }
    }
}
