//
//  OrderType.swift
//  PodongPodong
//
//  Created by 김민석 on 6/8/25.
//

enum OrderType: Int, Codable, Identifiable, CaseIterable {
    case groupPurchase = 0   // 공동구매
    case personalShopping = 1 // 장보기
    var id: Int { rawValue }
    var title: String {
        switch self {
        case .groupPurchase: return "공동구매"
        case .personalShopping:   return "장보기"
        }
    }
}
