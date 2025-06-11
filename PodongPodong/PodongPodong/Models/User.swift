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
    var profileImage: ProfileImage    // Asset 에서 불러오기
    var reviewRating: Double // 리뷰 평점

    // TODO: Asset 이름과 동일하게 수정하기
    enum ProfileImage: Codable, CaseIterable {
        case image1
        case image2
        case image3
        case image4
        case image5
        case image6
        case image7
        case image8
        case image9
        case image10
        case image11
        case image12
        
        var profileImage: String {
            switch self {
            case .image1:
                return "profileImage1"
            case .image2:
                return "profileImage2"
            case .image3:
                return "profileImage3"
            case .image4:
                return "profileImage4"
            case .image5:
                return "profileImage5"
            case .image6:
                return "profileImage6"
            case .image7:
                return "profileImage7"
            case .image8:
                return "profileImage8"
            case .image9:
                return "profileImage9"
            case .image10:
                return "profileImage10"
            case .image11:
                return "profileImage11"
            case .image12:
                return "profileImage12"
            }
        }
    }
}

extension User: EntityRepresentable {
    var entityName: CollectionType { .user }
    var documentID: String { email }
}
