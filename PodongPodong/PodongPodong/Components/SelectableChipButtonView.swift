//
//  ChipView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/3/25.
//

import SwiftUI

struct SelectableChipButtonView: View {
    let title: String
    @Binding var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.pretendardSemibold18)
                .foregroundColor(isSelected ? .secondary : .gray70)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.primaryColor : Color.gray10)
                .cornerRadius(30)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @State var isSelected1 = true
    @Previewable @State var isSelected2 = false
    
    SelectableChipButtonView(title: "칩 내용", isSelected: $isSelected1, action: {isSelected1.toggle()})
    SelectableChipButtonView(title: "칩 내용입니다", isSelected: $isSelected2, action: {isSelected2.toggle()})
}
