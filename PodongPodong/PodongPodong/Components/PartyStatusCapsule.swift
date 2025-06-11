//
//  PartyStatusCapsule.swift
//  PodongPodong
//
//  Created by 김민석 on 6/5/25.
//

import SwiftUI

struct MyPartyStatusCapsuleView: View {
    let myPartyStatus: MyPartyStatus
    
    private var backgroundColor: Color {
        switch myPartyStatus {
        case .waiting:
            return Color(hex: "F9E4FF")
        case .joined:
            return Color(hex: "D5E9FF")
        case .created:
            return Color.yellow.opacity(0.2)
//            return Color.clear
        }
    }
    
    private var foregroundColor: Color {
        switch myPartyStatus {
        case .waiting:
            return Color(hex: "8437E8")
        case .joined:
            return Color(hex: "2E5682")
        case .created:
            return Color.red.opacity(0.2)
        }
    }
    
    var body: some View {
        Text(myPartyStatus.displayName)
            .font(.pretendardSemibold11)       // 원하는 폰트
            .foregroundColor(foregroundColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(backgroundColor)
            )
    }
}

enum MyPartyStatus {
    case waiting, joined, created

    var displayName: String {
        switch self {
        case .waiting: "참여 대기중"
        case .joined: "참여중"
        case .created: "👑"
        }
    }
}

#Preview {
    MyPartyStatusCapsuleView(myPartyStatus: .waiting)
    MyPartyStatusCapsuleView(myPartyStatus: .joined)
    MyPartyStatusCapsuleView(myPartyStatus: .created)
}
