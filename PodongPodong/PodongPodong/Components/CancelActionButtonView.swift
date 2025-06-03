//
//  CancelActionButtonView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/3/25.
//

import SwiftUI

struct CancelActionButtonView: View {
    var cancelTitle: String = "취소"
    var actionTitle: String = "액션"
    var onCancel: () -> Void = {}
    var onAction: () -> Void = {}

    var body: some View {
        HStack(spacing: 11) {
            Button(action: onCancel) {
                Text(cancelTitle)
                    .font(.pretendardSemibold18)
                    .frame(width: 175, height: 56)
                    .foregroundColor(Color.gray40)
                    .background(Color.gray10)
                    .cornerRadius(12)
            }

            Button(action: onAction) {
                Text(actionTitle)
                    .font(.pretendardSemibold18)
                    .foregroundColor(Color.secondary)
                    .frame(width: 175, height: 56)
                    .background(Color.primaryColor)
                    .cornerRadius(12)
            }
        }
    }
}

#Preview {
    CancelActionButtonView(cancelTitle: "취소", actionTitle: "실행", onCancel: {}, onAction: {})
}
