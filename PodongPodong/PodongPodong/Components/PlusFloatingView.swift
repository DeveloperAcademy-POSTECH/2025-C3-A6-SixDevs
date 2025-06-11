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
        Image("plusIcon")
            .frame(width: 25, height: 25)
            .background(
                Circle()
                    .fill(Color.primaryColor)
                    .frame(width: 56, height: 56)
            )
    }
}

#Preview {
    PlusFloatingView(size: 56)
}
