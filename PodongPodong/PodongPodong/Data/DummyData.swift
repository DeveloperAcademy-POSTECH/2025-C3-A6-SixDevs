//
//  DummyData.swift
//  PodongPodong
//
//  Created by 김민석 on 6/5/25.
//

import Foundation

enum DummyData {
    static let user = User(
        email: "alstjr7437@postech.ac.kr",
        nickName: "심성이착한사람",
        profileImage: .image1,
        reviewRating: 4.7
    )
    
    // MARK: 공동구매 파티 3개
    static let partyGroup1 = Party(
        writen: user,
        title: "삼겹살 3kg 같이 사요",
        category: .meat,
        orderType: .groupPurchase,
        recruitmentCount: 3,
        purchaseChannel: .online,
        purchaseLocation: "https://shopping.example.com/store/5678",
        totalPrice: 30000,
        weightAndCount: .weight,
        amount: 3000,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 1),
            time: Date().addingTimeInterval(3600 * 24 * 1 + 3600),
            location: "부산 해운대 시장"
        ),
        description: "함께 주문하면 배송비 아깝지 않아요! 같이 가실 분 구합니다.",
        chatURL: "https://chat.example.com/room/XYZ789"
    )
    
    static let partyGroup2 = Party(
        writen: user,
        title: "과일 묶음 공동구매해요 (사과·배·포도)",
        category: .fruit,
        orderType: .groupPurchase,
        recruitmentCount: 5,
        purchaseChannel: .online,
        purchaseLocation: "https://shopping.example.com/store/1234",
        totalPrice: 50000,
        weightAndCount: .count,
        amount: 10,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 48),
            time: Date().addingTimeInterval(3600 * 48 + 1800),
            location: "서울 강남 농수산물시장"
        ),
        description: "싱싱한 과일을 저렴하게 구매할 기회예요. 재고 소진 전에 참여하세요!",
        chatURL: "https://chat.example.com/room/ABC123"
    )
    
    static let partyGroup3 = Party(
        writen: user,
        title: "해산물 세트 공동구매 (오징어·새우·홍합)",
        category: .seafood,
        orderType: .groupPurchase,
        recruitmentCount: 4,
        purchaseChannel: .offline,
        purchaseLocation: "부산 자갈치 시장",
        totalPrice: 80000,
        weightAndCount: .weight,
        amount: 2000,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 72),
            time: Date().addingTimeInterval(3600 * 72 + 3600 * 2),
            location: "부산 자갈치 시장 3층 집결지"
        ),
        description: "바다 향 가득한 신선 해산물, 인원 모이면 추가 할인 있어요!",
        chatURL: "https://chat.example.com/room/SEA456"
    )
    
    // MARK: 장보기 파티 2개
    static let partyShopping1 = Party(
        writen: user,
        title: "장보기 같이 해요: 야채·두부·계란",
        category: .vegetable,
        orderType: .personalShopping,
        recruitmentCount: 2,
        purchaseChannel: .online,
        purchaseLocation: "https://shopping.example.com/store/9012",
        totalPrice: 20000,
        weightAndCount: .weight,
        amount: 2500,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 2),
            time: Date().addingTimeInterval(3600 * 24 * 2 + 3600),
            location: "부산 센텀시티 이마트"
        ),
        description: "저는 주말에 야채랑 두부, 계란 구매 예정이에요. 같이 주문할 분, 연락주세요!",
        chatURL: "https://chat.example.com/room/SHOP123"
    )
    
    static let partyShopping2 = Party(
        writen: user,
        title: "장보기 파티: 간식류·음료",
        category: .fruit,
        orderType: .personalShopping,
        recruitmentCount: 3,
        purchaseChannel: .offline,
        purchaseLocation: "부산 서면 롯데마트",
        totalPrice: 15000,
        weightAndCount: .count,
        amount: 6,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 3),
            time: Date().addingTimeInterval(3600 * 24 * 3 + 3600 * 3),
            location: "부산 서면 롯데마트 정문 앞"
        ),
        description: "주말에 간식이랑 음료 사러 가는데, 같이 가실 분 구해요. 인원수만큼 할인가 적용됩니다!",
        chatURL: "https://chat.example.com/room/SNACK456"
    )
    
    // 모든 더미 파티를 통합한 배열 (필요 시 사용)
    static let allParties: [Party] = [
        partyGroup1,
        partyGroup2,
        partyGroup3,
        partyShopping1,
        partyShopping2
    ]
}
