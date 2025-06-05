//
//  Font.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretend {
        case extraBold
        case bold
        case semibold
        case medium
        case regular
        case light
        
        var value: String {
            switch self {
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    // Bold
    static var pretendardBold18: Font { .pretend(type: .bold, size: 18) }
    static var pretendardBold20: Font { .pretend(type: .bold, size: 20) }
    static var pretendardBold24: Font { .pretend(type: .bold, size: 24) }
    static var pretendardBold28: Font { .pretend(type: .bold, size: 28) }
    
    // SemiBold
    static var pretendardSemibold12: Font { .pretend(type: .semibold, size: 12) }
    static var pretendardSemibold13: Font { .pretend(type: .semibold, size: 13) }
    static var pretendardSemibold14: Font { .pretend(type: .semibold, size: 14) }
    static var pretendardSemibold16: Font { .pretend(type: .semibold, size: 16) }
    static var pretendardSemibold18: Font { .pretend(type: .semibold, size: 18) }
    static var pretendardSemibold24: Font { .pretend(type: .semibold, size: 24) }
    static var pretendardSemibold38: Font { .pretend(type: .semibold, size: 38) }
    
    // Medium
    static var pretendardMedium14: Font  { .pretend(type: .medium, size: 14) }
    static var pretendardMedium16: Font  { .pretend(type: .medium, size: 16) }
    static var pretendardMedium18: Font  { .pretend(type: .medium, size: 18) }
    
    // Regular
    static var pretendardRegular9: Font  { .pretend(type: .regular, size: 9)  }
    static var pretendardRegular12: Font { .pretend(type: .regular, size: 12) }
    static var pretendardRegular13: Font { .pretend(type: .regular, size: 13) }
    static var pretendardRegular18: Font { .pretend(type: .regular, size: 18) }
    
    // Light
    static var pretendardLight14: Font   { .pretend(type: .light, size: 14) }
    
    // ExtraBold
    static var pretendardExtraBold24: Font { .pretend(type: .extraBold, size: 24) }
    
    
}
