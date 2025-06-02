//
//  User.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

struct User {
    let email: String // UUID
    let nickName: String // 앱 활동 이름
    let profileImage: ProfileImage    // Asset 에서 불러오기
    let reviewRating: Double // 리뷰 평점

    // TODO: Asset 이름과 동일하게 수정하기
    enum ProfileImage {
        case image1
        case image2
        case image3
        case image4
        
        var profileImage: String {
            switch self {
            case .image1:
                return "1번 이미지" // FIXME: -
            case .image2:
                return "2번 이미지" // FIXME: -
            case .image3:
                return "3번 이미지" // FIXME: -
            case .image4:
                return "4번 이미지" // FIXME: -
            }
        }
    }
}
