//
//  CancelActionButtonView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/3/25.
//

import SwiftUI

struct CancelActionButtonView: View {
    let cancelTitle: String
    let actionTitle: String
    let onCancel: () -> Void
    let onAction: () -> Void

    var body: some View {
        HStack(spacing: 11) {
            Button(action: onCancel) {
                Text(cancelTitle)
                    .font(.pretendardSemibold18)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity / 2)
                    .foregroundColor(Color.gray40)
                    .background(Color.gray10)
                    .cornerRadius(12)
            }

            Button(action: onAction) {
                Text(actionTitle)
                    .font(.pretendardSemibold18)
                    .foregroundColor(Color.secondary)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity / 2)
                    .background(Color.primaryColor)
                    .cornerRadius(12)
            }
        }
    }
}

#Preview {
    CancelActionButtonView(cancelTitle: "취소", actionTitle: "실행", onCancel: {}, onAction: {})
        .frame(width: 351)
}
