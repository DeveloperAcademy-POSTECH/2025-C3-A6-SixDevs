//
//  WeightAndCount.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

enum WeightAndCount: Int, Codable, Identifiable, CaseIterable {
    case weight = 0
    case count
    
    var id: Int { rawValue }
    
    var displayName: String {
        switch self {
        case .weight: "g"
        case .count: "개"
        }
    }
}
