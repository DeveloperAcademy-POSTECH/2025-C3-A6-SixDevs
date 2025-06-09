//
//  PartyStatus.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

enum PartyStatus: Int, Identifiable, CaseIterable, Codable {
    case recruiting = 0
    case inProgress // 진행중
    case completed  // 종료
    
    var id: Int { rawValue }

    var displayName: String {
        switch self {
        case .recruiting: "모집중"
        case .inProgress: "진행중"
        case .completed: "종료"
        }
    }
}
