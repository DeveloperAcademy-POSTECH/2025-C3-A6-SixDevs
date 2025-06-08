//
//  Review+MockData.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import Foundation

extension Review {
    // MARK: - Sample Reviews
    static let sampleReviews: [Review] = [
        Review(
            star: 5,
            contents: [.review1, .review2],
            toUser: User.sampleUsers[0],
            fromUser: User.sampleUsers[1]
        ),
        Review(
            star: 4,
            contents: [.review1, .review3],
            toUser: User.sampleUsers[0],
            fromUser: User.sampleUsers[2]
        ),
        Review(
            star: 5,
            contents: [.review1, .review2, .review4],
            toUser: User.sampleUsers[0],
            fromUser: User.sampleUsers[3]
        ),
        Review(
            star: 3,
            contents: [.review2],
            toUser: User.sampleUsers[1],
            fromUser: User.sampleUsers[4]
        ),
        Review(
            star: 5,
            contents: [.review1, .review4],
            toUser: User.sampleUsers[5],
            fromUser: User.sampleUsers[6]
        ),
        Review(
            star: 4,
            contents: [.review2, .review3],
            toUser: User.sampleUsers[6],
            fromUser: User.sampleUsers[7]
        ),
        Review(
            star: 5,
            contents: [.review1, .review2, .review3, .review4],
            toUser: User.sampleUsers[7],
            fromUser: User.sampleUsers[8]
        ),
        Review(
            star: 2,
            contents: [.review3],
            toUser: User.sampleUsers[2],
            fromUser: User.sampleUsers[9]
        )
    ]
}
