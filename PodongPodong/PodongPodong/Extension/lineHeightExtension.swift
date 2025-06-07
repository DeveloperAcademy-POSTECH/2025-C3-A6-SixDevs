//
//  lineHeightExtension.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import SwiftUI

extension View {
    /// 줄 높이를 %로 설정하는 메서드 (예: 1.25 = 125%)
    func lineHeight(_ multiplier: CGFloat, fontSize: CGFloat) -> some View {
        let lineSpacing = fontSize * (multiplier - 1)
        return self.lineSpacing(lineSpacing)
    }
}
