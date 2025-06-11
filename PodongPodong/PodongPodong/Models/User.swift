//
//  User.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//
import Foundation

struct User: Identifiable, Codable {
    let id: UUID = UUID()
    let email: String
    let nickName: String // 앱 활동 이름
    var profileImage: String    // Asset 에서 불러오기
    var reviewRating: Double // 리뷰 평점
}

extension User: EntityRepresentable {
    var entityName: CollectionType { .user }
    var documentID: String { email }
}
