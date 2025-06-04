//
//  FoodCategory.swift
//  PodongPodong
//
//  Created by 김민석 on 6/2/25.
//

enum FoodCategory: CaseIterable, Codable {
    case meat
    case vegetable
    case fruit
    case seafood
    case etc
    
    var displayName: String {
        switch self {
        case .meat: return "육류"
        case .vegetable: return "채소"
        case .fruit: return "과일"
        case .seafood: return "해산물"
        case .etc: return "기타"
        }
    }
}
