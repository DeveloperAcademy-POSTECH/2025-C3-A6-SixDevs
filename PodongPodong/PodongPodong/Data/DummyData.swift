//
//  DummyData.swift
//  PodongPodong
//
//  Created by Paidion on 6/9/25.
//

import Foundation


enum DummyData {
    static let user = User(
        email: "alstjr7437@postech.ac.kr",
        nickName: "심성이착한사람",
        profileImage: .image1,
        reviewRating: 4.7
    )

    // MARK: - 공동구매 파티 10개
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
            time: Date().addingTimeInterval(3600 * 72 + 7200),
            location: "부산 자갈치 시장 3층 집결지"
        ),
        description: "바다 향 가득한 신선 해산물, 인원 모이면 추가 할인 있어요!",
        chatURL: "https://chat.example.com/room/SEA456"
    )

    static let partyGroup4 = Party(
        writen: user,
        title: "채소 공동구매 - 오프라인",
        category: .vegetable,
        orderType: .groupPurchase,
        recruitmentCount: 5,
        purchaseChannel: .offline,
        purchaseLocation: "강남 농수산물시장",
        totalPrice: 25000,
        weightAndCount: .weight,
        amount: 3000,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 5),
            time: Date().addingTimeInterval(3600 * 24 * 5 + 1800),
            location: "강남 농수산물시장 입구"
        ),
        description: "채소를 저렴하게 오프라인에서 함께 구매해요.",
        chatURL: "https://chat.example.com/room/VEG1"
    )

    static let partyGroup5 = Party(
        writen: user,
        title: "기타 식품 공동구매 - 온라인",
        category: .etc,
        orderType: .groupPurchase,
        recruitmentCount: 2,
        purchaseChannel: .online,
        purchaseLocation: "https://shopping.example.com/store/etc1",
        totalPrice: 15000,
        weightAndCount: .count,
        amount: 5,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 8),
            time: Date().addingTimeInterval(3600 * 24 * 8 + 3600),
            location: "대전역 앞"
        ),
        description: "기타 식품도 함께 공동구매해요.",
        chatURL: "https://chat.example.com/room/ETC1"
    )

    static let partyGroup6 = Party(
        writen: user,
        title: "육류 공동구매 - 오프라인",
        category: .meat,
        orderType: .groupPurchase,
        recruitmentCount: 4,
        purchaseChannel: .offline,
        purchaseLocation: "수원 전통시장",
        totalPrice: 42000,
        weightAndCount: .weight,
        amount: 2500,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 9),
            time: Date().addingTimeInterval(3600 * 24 * 9 + 3600),
            location: "수원 전통시장 정문"
        ),
        description: "육류를 오프라인에서 저렴하게!",
        chatURL: "https://chat.example.com/room/MEAT2"
    )

    static let partyGroup7 = Party(
        writen: user,
        title: "채소 공동구매 - 온라인",
        category: .vegetable,
        orderType: .groupPurchase,
        recruitmentCount: 3,
        purchaseChannel: .online,
        purchaseLocation: "https://shopping.example.com/store/veg2",
        totalPrice: 18000,
        weightAndCount: .count,
        amount: 8,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 10),
            time: Date().addingTimeInterval(3600 * 24 * 10 + 3600),
            location: "서울역 1층"
        ),
        description: "신선 채소 온라인 공동구매!",
        chatURL: "https://chat.example.com/room/VEG2"
    )

    static let partyGroup8 = Party(
        writen: user,
        title: "과일 공동구매 - 오프라인",
        category: .fruit,
        orderType: .groupPurchase,
        recruitmentCount: 5,
        purchaseChannel: .offline,
        purchaseLocation: "대구 농산물시장",
        totalPrice: 27000,
        weightAndCount: .count,
        amount: 10,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 11),
            time: Date().addingTimeInterval(3600 * 24 * 11 + 3600),
            location: "대구 농산물시장 입구"
        ),
        description: "과일을 오프라인에서 함께 구매해요.",
        chatURL: "https://chat.example.com/room/FRUIT2"
    )

    static let partyGroup9 = Party(
        writen: user,
        title: "해산물 공동구매 - 온라인",
        category: .seafood,
        orderType: .groupPurchase,
        recruitmentCount: 4,
        purchaseChannel: .online,
        purchaseLocation: "https://shopping.example.com/store/seafood2",
        totalPrice: 55000,
        weightAndCount: .weight,
        amount: 3500,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 12),
            time: Date().addingTimeInterval(3600 * 24 * 12 + 3600),
            location: "부산역 앞"
        ),
        description: "해산물 온라인 공동구매!",
        chatURL: "https://chat.example.com/room/SEAFOOD2"
    )

    static let partyGroup10 = Party(
        writen: user,
        title: "기타 식품 공동구매 - 오프라인",
        category: .etc,
        orderType: .groupPurchase,
        recruitmentCount: 3,
        purchaseChannel: .offline,
        purchaseLocation: "광주 시장",
        totalPrice: 12000,
        weightAndCount: .count,
        amount: 6,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 13),
            time: Date().addingTimeInterval(3600 * 24 * 13 + 3600),
            location: "광주 시장 입구"
        ),
        description: "기타 식품 오프라인 공동구매!",
        chatURL: "https://chat.example.com/room/ETC2"
    )

    // MARK: - 장보기 파티 10개
    static let partyShopping1 = Party(
        writen: user,
        title: "장보기 같이 해요: 야채·두부·계란",
        category: .vegetable,
        orderType: .personalShopping,
        recruitmentCount: 2,
        purchaseChannel: .offline,
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
            time: Date().addingTimeInterval(3600 * 24 * 3 + 10800),
            location: "부산 서면 롯데마트 정문 앞"
        ),
        description: "주말에 간식이랑 음료 사러 가는데, 같이 가실 분 구해요. 인원수만큼 할인가 적용됩니다!",
        chatURL: "https://chat.example.com/room/SNACK456"
    )

    static let partyShopping3 = Party(
        writen: user,
        title: "육류 장보기 - 오프라인",
        category: .meat,
        orderType: .personalShopping,
        recruitmentCount: 2,
        purchaseChannel: .offline,
        purchaseLocation: "https://shopping.example.com/store/meat2",
        totalPrice: 22000,
        weightAndCount: .weight,
        amount: 1200,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 14),
            time: Date().addingTimeInterval(3600 * 24 * 14 + 3600),
            location: "서울 마트"
        ),
        description: "육류 장보기, 온라인으로 빠르게!",
        chatURL: "https://chat.example.com/room/MEATSHOP1"
    )

    static let partyShopping4 = Party(
        writen: user,
        title: "채소 장보기 - 오프라인",
        category: .vegetable,
        orderType: .personalShopping,
        recruitmentCount: 3,
        purchaseChannel: .offline,
        purchaseLocation: "강남 마트",
        totalPrice: 9000,
        weightAndCount: .weight,
        amount: 2000,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 15),
            time: Date().addingTimeInterval(3600 * 24 * 15 + 1800),
            location: "강남 마트 입구"
        ),
        description: "채소 장보기, 오프라인에서 함께해요.",
        chatURL: "https://chat.example.com/room/VEGSHOP1"
    )

    static let partyShopping5 = Party(
        writen: user,
        title: "과일 장보기 - 오프라인",
        category: .fruit,
        orderType: .personalShopping,
        recruitmentCount: 2,
        purchaseChannel: .offline,
        purchaseLocation: "https://shopping.example.com/store/fruit2",
        totalPrice: 12000,
        weightAndCount: .count,
        amount: 7,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 16),
            time: Date().addingTimeInterval(3600 * 24 * 16 + 3600),
            location: "서울역 2층"
        ),
        description: "과일 장보기, 온라인으로 저렴하게!",
        chatURL: "https://chat.example.com/room/FRUITSHOP1"
    )

    static let partyShopping6 = Party(
        writen: user,
        title: "해산물 장보기 - 오프라인",
        category: .seafood,
        orderType: .personalShopping,
        recruitmentCount: 4,
        purchaseChannel: .offline,
        purchaseLocation: "부산 수산시장",
        totalPrice: 30000,
        weightAndCount: .weight,
        amount: 1800,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 17),
            time: Date().addingTimeInterval(3600 * 24 * 17 + 3600),
            location: "부산 수산시장 정문"
        ),
        description: "해산물 장보기, 부산에서 신선하게!",
        chatURL: "https://chat.example.com/room/SEAFOODSHOP1"
    )

    static let partyShopping7 = Party(
        writen: user,
        title: "기타 식품 장보기 - 오프라인",
        category: .etc,
        orderType: .personalShopping,
        recruitmentCount: 2,
        purchaseChannel: .offline,
        purchaseLocation: "https://shopping.example.com/store/etc2",
        totalPrice: 8000,
        weightAndCount: .count,
        amount: 4,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 18),
            time: Date().addingTimeInterval(3600 * 24 * 18 + 3600),
            location: "대전 마트"
        ),
        description: "기타 식품 장보기, 온라인에서 쉽게!",
        chatURL: "https://chat.example.com/room/ETCSHOP1"
    )

    static let partyShopping8 = Party(
        writen: user,
        title: "육류 장보기 - 오프라인",
        category: .meat,
        orderType: .personalShopping,
        recruitmentCount: 3,
        purchaseChannel: .offline,
        purchaseLocation: "수원 마트",
        totalPrice: 25000,
        weightAndCount: .weight,
        amount: 1300,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 19),
            time: Date().addingTimeInterval(3600 * 24 * 19 + 3600),
            location: "수원 마트 입구"
        ),
        description: "육류 장보기, 수원에서 모여요!",
        chatURL: "https://chat.example.com/room/MEATSHOP2"
    )

    static let partyShopping9 = Party(
        writen: user,
        title: "채소 장보기 - 오프라인",
        category: .vegetable,
        orderType: .personalShopping,
        recruitmentCount: 2,
        purchaseChannel: .offline,
        purchaseLocation: "https://shopping.example.com/store/veg3",
        totalPrice: 11000,
        weightAndCount: .count,
        amount: 6,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 20),
            time: Date().addingTimeInterval(3600 * 24 * 20 + 3600),
            location: "서울역 3층"
        ),
        description: "채소 장보기, 온라인 공동구매!",
        chatURL: "https://chat.example.com/room/VEGSHOP2"
    )

    static let partyShopping10 = Party(
        writen: user,
        title: "기타 식품 장보기 - 오프라인",
        category: .etc,
        orderType: .personalShopping,
        recruitmentCount: 2,
        purchaseChannel: .offline,
        purchaseLocation: "광주 마트",
        totalPrice: 9000,
        weightAndCount: .count,
        amount: 3,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24 * 23),
            time: Date().addingTimeInterval(3600 * 24 * 23 + 3600),
            location: "광주 마트 입구"
        ),
        description: "기타 식품 장보기, 광주에서 함께!",
        chatURL: "https://chat.example.com/room/ETCSHOP2"
    )
    

    
    static let allParties: [Party] = [
        partyGroup1,
        partyGroup2,
        partyGroup3,
        partyGroup4,
        partyGroup5,
        partyGroup6,
        partyGroup7,
        partyGroup8,
        partyGroup9,
        partyGroup10,
        partyShopping1,
        partyShopping2,
        partyShopping3,
        partyShopping4,
        partyShopping5,
        partyShopping6,
        partyShopping7,
        partyShopping8,
        partyShopping9,
        partyShopping10
    ]
    
    
}
