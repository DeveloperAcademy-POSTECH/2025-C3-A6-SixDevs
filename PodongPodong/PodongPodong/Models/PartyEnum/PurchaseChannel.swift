//
//  PurchaseChannel.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

enum PurchaseChannel: Int, Identifiable, CaseIterable, Codable  {
    case online = 0
    case offline
    
    var id: Int { rawValue }
    
    var displayName: String {
        switch self {
        case .online: "온라인 구매"
        case .offline: "오프라인 구매"
        }
    }
}
