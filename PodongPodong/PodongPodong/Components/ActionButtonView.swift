//
//  ButtonComponent.swift
//  PodongPodong
//
//  Created by 김민석 on 6/3/25.
//

import SwiftUI

struct ActionButtonView: View {
    let title: String
    @State var isEnabled: Bool = true
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.pretendardSemibold18)
                .foregroundColor(isEnabled ? .secondary : .gray40)
                .frame(width: 361, height: 56)
                .background(isEnabled ? Color.primaryColor : Color.gray10)
                .cornerRadius(12)
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    ActionButtonView(title: "실행하기", action: { })
    ActionButtonView(title: "실행하기", isEnabled: false, action: {})
}
