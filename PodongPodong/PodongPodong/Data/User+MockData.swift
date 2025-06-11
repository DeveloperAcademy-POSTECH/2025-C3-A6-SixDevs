//
//  User+MockData.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import Foundation

extension User {
    // MARK: - Sample Users
    static let sampleUsers: [User] = [
        User(
            email: "host@example.com",
            nickName: "삼겹살만취급함",
            profileImage: "profileImage1",
            reviewRating: 4.8
        ),
        User(
            email: "shopper@example.com",
            nickName: "쇼핑중독",
            profileImage: "profileImage1",
            reviewRating: 4.6
        ),
        User(
            email: "ddung@example.com",
            nickName: "뚠뚠",
            profileImage: "profileImage1",
            reviewRating: 4.9
        ),
        User(
            email: "duck@example.com",
            nickName: "파덕",
            profileImage: "profileImage1",
            reviewRating: 4.2
        ),
        User(
            email: "salmon@example.com",
            nickName: "매일연어만먹음",
            profileImage: "profileImage1",
            reviewRating: 4.7
        ),
        User(
            email: "foodie@example.com",
            nickName: "맛집탐험가",
            profileImage: "profileImage1",
            reviewRating: 4.5
        ),
        User(
            email: "health@example.com",
            nickName: "건강식단러버",
            profileImage: "profileImage1",
            reviewRating: 4.8
        ),
        User(
            email: "cook@example.com",
            nickName: "쿠킹마스터",
            profileImage: "profileImage1",
            reviewRating: 4.9
        ),
        User(
            email: "organic@example.com",
            nickName: "유기농만먹어요",
            profileImage: "profileImage1",
            reviewRating: 4.3
        ),
        User(
            email: "budget@example.com",
            nickName: "알뜰살뜰주부",
            profileImage: "profileImage1",
            reviewRating: 4.6
        ),
        User(
            email: "veggie@example.com",
            nickName: "채식주의자",
            profileImage: "profileImage1",
            reviewRating: 4.4
        ),
        User(
            email: "meat@example.com",
            nickName: "고기러버",
            profileImage: "profileImage1",
            reviewRating: 4.7
        ),
    ]

    // MARK: - Convenient Access
    static var sampleHost: User { sampleUsers[0] }
    static var sampleCurrentUser: User { sampleUsers[1] }
}
