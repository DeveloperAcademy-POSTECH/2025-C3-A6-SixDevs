//
//  AuthError.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/8/25.
//

import Foundation

enum AuthError: LocalizedError {
    case invalidLink
    case unknown
    case firebaseError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidLink:
            return "유효하지 않은 인증 링크입니다."
        case .unknown:
            return "알 수 없는 오류가 발생했습니다."
        case .firebaseError(let error):
            return error.localizedDescription
        }
    }
}
