//
//  Review.swift
//  PodongPodong
//
//  Created by 김민석 on 6/2/25.
//

import Foundation

struct Review {
    let id: UUID = UUID()
    let star: Int
    let contents: [ReviewContent]
    let toUser: User  // 받는 사람
    let fromUser: User    // 주는 사람
    
    enum ReviewContent {
        case review1
        case review2
        case review3
        case review4
        
        var reviewContent: String {
            switch self {
            case .review1:
                return "1번 리뷰" // FIXME: -
            case .review2:
                return "2번 리뷰" // FIXME: -
            case .review3:
                return "3번 리뷰" // FIXME: -
            case .review4:
                return "4번 리뷰" // FIXME: -
            }
        }
    }
}

