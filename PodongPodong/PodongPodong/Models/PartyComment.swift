//
//  PartyComment.swift
//  PodongPodong
//
//  Created by 김민석 on 6/2/25.
//

import Foundation

struct PartyComment: Codable {
    var id: UUID = UUID()
    let user: User
    let isPublic: Bool
    let content: String
    var createdAt: Date = Date()
}

extension PartyComment: EntityRepresentable {
    var entityName: CollectionType { .partyComment }
    var documentID: String { id.uuidString }
}
