//
//  Party.swift
//  PodongPodong
//
//  Created by 김민석 on 6/2/25.
//

import Foundation

struct Party: Codable, Identifiable {
    // 파티 생성시 만들어져야할 데이터
    /// id(UUID), 작성자, 파티원,  생성일, 업데이트일, 참여 대기 인원
    private(set) var id: UUID = UUID() // .toString
    private(set) var writen: User // User email (파티 만든사람)
    var member: [User] = []
    private(set) var createdAt: Date = Date() // 글 작성 시간
    var updatedAt: Date = Date()
    var status: PartyStatus = .recruiting // 파티 상태
    var waitingMembers: [User] = [] // 파티 참여 대기 인원
    var viewCount: Int = 1
    var likeCount: Int = 0
    
    // 유저가 입력해야할 데이터(필수)
    /// 제목, 카테고리, 구매방식, 모집인원, 구매처, 총 가격, 무게 및 수량
    var title: String
    var category: FoodCategory // 카테고리 : 육류, 채소, 과일, 해산물, 기타
    let orderType: OrderType // 구매 방식 : 공동구매, 장보기
    var recruitmentCount: Int // 모집 인원 수 : 2 ~ 8
    var purchaseChannel: PurchaseChannel // 구매처 (온라인 / 오프라인)
    var purchaseLocation: String // 입력받은 구매 장소 (URL || 장소)
    var totalPrice: Int
    var weightAndCount: WeightAndCount
    var amount: Int
    
    // 유저가 입력해야할 데이터(필수X)
    // 약속 일정, 상세 내용
    var appointment: Appointment
    var description: String?
    
    // 부가적인 데이터
    var comments: [PartyComment] = [] // 댓글
    let chatURL: String? // 채팅 딥링크를 위한 부분
    
    init(
        writen: User,
        title: String,
        category: FoodCategory,
        orderType: OrderType,
        recruitmentCount: Int,
        purchaseChannel: PurchaseChannel,
        purchaseLocation: String,
        totalPrice: Int,
        weightAndCount: WeightAndCount,
        amount: Int,
        appointment: Appointment,
        description: String?,
        chatURL: String?
    ) {
        self.writen = writen
        self.title = title
        self.category = category
        self.orderType = orderType
        self.recruitmentCount = recruitmentCount
        self.purchaseChannel = purchaseChannel
        self.purchaseLocation = purchaseLocation
        self.totalPrice = totalPrice
        self.weightAndCount = weightAndCount
        self.amount = amount
        self.appointment = appointment
        self.description = description
        self.chatURL = chatURL
    }
    
    // MARK: - 파티 추가 데이터
    
    struct Appointment: Codable{
        var date: String?
        var time: String?
        var location: String?
    }
}

extension Party: EntityRepresentable {
    var entityName: CollectionType { .party }
    var documentID: String { id.uuidString }
}
