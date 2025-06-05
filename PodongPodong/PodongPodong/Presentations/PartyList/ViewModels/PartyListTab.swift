//
//  PartyListTab.swift
//  PodongPodong
//
//  Created by 김민석 on 6/5/25.
//

enum PartyListTab: Int, CaseIterable, Identifiable {
    case 공동구매 = 0, 장보기
    var id: Int { rawValue }
    var title: String {
        switch self {
        case .공동구매: return "공동구매"
        case .장보기:   return "장보기"
        }
    }
}
