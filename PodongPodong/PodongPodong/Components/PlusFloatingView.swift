//
//  PlusFloatingView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/8/25.
//

import SwiftUI

struct PlusFloatingView: View {
    let size: CGFloat      // 버튼 전체 크기
    
    init(size: CGFloat = 56) {
        self.size = size
    }
    
    var body: some View {
        Image(systemName: "plus")
            .font(.system(size: size / 2, weight: .bold))
            .frame(width: size, height: size)
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(Color.primaryColor)
            )
    }
}

#Preview {
    PlusFloatingView(size: 56)
}
