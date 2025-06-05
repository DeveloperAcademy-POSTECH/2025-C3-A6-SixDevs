//
//  ButtonComponent.swift
//  PodongPodong
//
//  Created by 김민석 on 6/3/25.
//

import SwiftUI

struct ActionButtonView: View {
    let title: String
    let isEnabled: Bool
    
    var body: some View {
        Text(title)
            .font(.pretendardSemibold18)
            .foregroundColor(isEnabled ? .secondary : .gray40)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(isEnabled ? Color.primaryColor : Color.gray10)
            .cornerRadius(12)
    }
}

#Preview {
    ActionButtonView(title: "실행하기", isEnabled: true)
        .frame(width: 351)
    ActionButtonView(title: "실행하기", isEnabled: false)
        .frame(width: 160)
}
