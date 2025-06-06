//
//  PurchaseChannel.swift
//  PodongPodong
//
//  Created by Paidion on 6/6/25.
//

enum PurchaseChannel: CaseIterable, Codable {
    case online
    case offline
 
    var displayName: String {
        switch self {
        case .online: return "온라인"
        case .offline: return "오프라인"
        }
    }
}
