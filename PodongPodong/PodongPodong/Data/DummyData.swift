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
    
    static let party = Party(
        writen: user,
        title: "삼겹살 3kg 같이 사요",
        category: .meat,
        orderType: .personalShopping,
        recruitmentCount: 3,
        purchaseChannel: .online,
        purchaseLocation: "https://shopping.example.com/store/5678",
        totalPrice: 30000,
        weightAndCount: .weight,
        amount: 3000,
        appointment: Party.Appointment(
            date: Date().addingTimeInterval(3600 * 24),
            time: Date().addingTimeInterval(3600 * 25),
            location: "부산 해운대 시장"
        ),
        description: "함께 주문하면 배송비 아깝지 않아요! 같이 가실 분 구합니다.",
        chatURL: "https://chat.example.com/room/XYZ789"
    )
}
