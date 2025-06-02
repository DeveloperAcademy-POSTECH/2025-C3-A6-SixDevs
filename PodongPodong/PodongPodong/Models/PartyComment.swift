//
//  PartyComment.swift
//  PodongPodong
//
//  Created by 김민석 on 6/2/25.
//

import Foundation

struct PartyComment {
    let id: UUID = UUID()
    let user: User
    let isPublic: Bool
    let content: String
    let createdAt: Date = Date()
}
