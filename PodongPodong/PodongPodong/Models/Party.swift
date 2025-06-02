//
//  Party.swift
//  PodongPodong
//
//  Created by 김민석 on 6/2/25.
//

import Foundation

struct Party {
    
    // 파티 생성시 만들어져야할 데이터
    /// id(UUID), 작성자, 파티원,  생성일, 업데이트일
    let id: UUID = UUID() // .toString
    let writen: User // User email (파티 만든사람)
    let member: [User] = []
    let createdAt: Date = Date() // 글 작성 시간
    let updatedAt: Date = Date()
    let status: PartyStatus = .recruiting // 파티 상태
    
    // 유저가 입력해야할 데이터(필수)
    /// 제목, 카테고리, 구매방식, 모집인원, 구매처, 총 가격, 무게 및 수량
    let title: String
    let category: FoodCategory // 카테고리 : 육류, 채소, 과일, 해산물, 기타
    let orderType: OrderType // 구매 방식 : 공동구매, 장보기
    let recruitmentCount: Int // 모집 인원 수 : 2 ~ 8
    let purchaseChannel: PurchaseChannel // 구매처 (온라인 / 오프라인)
    let purchaseLocation: String // 입력받은 구매 장소 (URL || 장소)
    let totalPrice: Int
    let weightAndCount: WeightAndCount
    let amount: Int
    
    // 유저가 입력해야할 데이터(필수X)
    // 약속 일정, 상세 내용
    let appointment: Appointment
    let description: String?
    
    // 부가적인 데이터
    let comments: [PartyComment] = [] // 댓글
    let chatURL: String? // 채팅 딥링크를 위한 부분
    
    // MARK: - 파티 추가 데이터
    
    enum OrderType {
        case groupPurchase   // 공동구매
        case personalShopping  // 장보기
    }
    
    enum PurchaseChannel {
        case online
        case offline
    }
    
    enum PartyStatus {
        case recruiting // 모집중
        case inProgress // 진행중
        case completed  // 종료
    }
    
    enum WeightAndCount {
        case weight
        case count
    }
    
    struct Appointment {
        var date: Date?
        var time: Date?
        var location: String?
    }
}
