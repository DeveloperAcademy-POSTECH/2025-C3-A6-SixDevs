//
//  Party+MockData.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import Foundation

extension Party {
    // MARK: - Sample Data
    static var sampleData: Party {
        return Party(
            writen: User.sampleHost,
//            member: Array(User.sampleUsers[1...2]), // 쇼핑중독, 뚠뚠
//            updatedAt: Date(),
//            status: PartyStatus.recruiting,
//            waitingMembers: Array(User.sampleUsers[3...4]),
            title: "냉장 삼겹살 3kg 파티원 모집",
            category: .meat,
            orderType: .groupPurchase,
            recruitmentCount: 6,
            purchaseChannel: .online,
            purchaseLocation: "https://www.coupang.com/vp/products/8610671752?itemId=24974313286&vendorItemId=89950890066",
            totalPrice: 45000,
            weightAndCount: .weight,
            amount: 3,
            appointment: Party.Appointment(
                date: Calendar.current.date(byAdding: .day, value: 2, to: Date()),
                time: Calendar.current.date(bySettingHour: 19, minute: 0, second: 0, of: Date()),
                location: "지곡회관 앞"
            ),
            description: "냉장 삼겹살 공구하실 분 모집합니다\n한분 당 1kg에 약 5800원으로 저렴하게 구매하실 수 있어요\n\n냉동보다는 냉장이 확실히 퀄리티가 좋으니\n많은 관심과 참여 바랍니다.",
//            comments: PartyComment.sampleComments,
            chatURL: nil
        )
    }
    
    // MARK: - Mock Data Set
//    static var mockDataSet: [Party] {
//        return [
//            // 1. 기본 모집중 파티
//            sampleData,
//            
//            // 2. 모집 완료된 파티 (진행중)
//            Party(
//                writen: User.sampleUsers[5], // 맛집탐험가
//                member: Array(User.sampleUsers[0...3]), // 4명 모집완료
//                updatedAt: Calendar.current.date(byAdding: .minute, value: -30, to: Date())!,
//                status: .inProgress,
//                waitingMembers: [], // 대기자 없음
//                title: "신선한 연어 사시미 2kg",
//                category: FoodCategory.seafood,
//                orderType: .groupPurchase,
//                recruitmentCount: 4,
//                purchaseChannel: .offline,
//                purchaseLocation: "노량진 수산시장",
//                totalPrice: 80000,
//                weightAndCount: .weight,
//                amount: 2,
//                appointment: Party.Appointment(
//                    date: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
//                    time: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date()),
//                    location: "노량진역 1번 출구"
//                ),
//                description: "노량진에서 직접 구매해오는 신선한 연어입니다.\n아침 일찍 구매해서 신선함을 보장합니다!",
//                comments: Array(PartyComment.sampleComments[1...5]),
//                chatURL: "https://open.kakao.com/o/samplelink1"
//            ),
//            
//            // 3. 대기자가 많은 파티
//            Party(
//                writen: User.sampleUsers[6], // 건강식단러버
//                member: [User.sampleUsers[7]], // 1명만 참여
//                updatedAt: Date(),
//                status: .recruiting,
//                waitingMembers: Array(User.sampleUsers[0...4]), // 5명 대기중
//                title: "유기농 채소 박스 (4인분)",
//                category: FoodCategory.vegetable,
//                orderType: .personalShopping,
//                recruitmentCount: 4,
//                purchaseChannel: .online,
//                purchaseLocation: "https://www.kurly.com/products/1234567",
//                totalPrice: 32000,
//                weightAndCount: .count,
//                amount: 1,
//                appointment: Party.Appointment(
//                    date: Calendar.current.date(byAdding: .day, value: 3, to: Date()),
//                    time: Calendar.current.date(bySettingHour: 18, minute: 30, second: 0, of: Date()),
//                    location: "학생회관 앞"
//                ),
//                description: "마켓컬리에서 주문하는 신선한 유기농 채소박스입니다.\n4인분으로 나눠 드세요! 건강한 식단 만들어봐요 🥬",
//                comments: Array(PartyComment.sampleComments[0...2]),
//                chatURL: nil
//            ),
//            
//            // 4. 완료된 파티
//            Party(
//                writen: User.sampleUsers[2], // 뚠뚠
//                member: Array(User.sampleUsers[3...7]), // 5명 참여완료
//                updatedAt: Calendar.current.date(byAdding: .hour, value: -1, to: Date())!,
//                status: .completed,
//                waitingMembers: [],
//                title: "제주 한라봉 5kg (완료)",
//                category: FoodCategory.fruit,
//                orderType: .groupPurchase,
//                recruitmentCount: 5,
//                purchaseChannel: .online,
//                purchaseLocation: "https://www.example-fruit.com/hallabong",
//                totalPrice: 75000,
//                weightAndCount: .weight,
//                amount: 5,
//                appointment: Party.Appointment(
//                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
//                    time: Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: Date()),
//                    location: "중앙도서관 앞"
//                ),
//                description: "제주도에서 직송되는 달콤한 한라봉입니다.\n성공적으로 완료되었습니다! 참여해주신 모든 분들 감사합니다 🍊",
//                comments: Array(PartyComment.sampleComments[3...5]),
//                chatURL: "https://open.kakao.com/o/completed"
//            ),
//            
//            // 5. 오프라인 장보기 파티
//            Party(
//                writen: User.sampleUsers[8], // 유기농만먹어요
//                member: Array(User.sampleUsers[9...10]), // 2명 참여
//                updatedAt: Date(),
//                status: .recruiting,
//                waitingMembers: [User.sampleUsers[11]], // 1명 대기
//                title: "이마트 대용량 냉동식품 공구",
//                category: FoodCategory.etc,
//                orderType: .personalShopping,
//                recruitmentCount: 4,
//                purchaseChannel: .offline,
//                purchaseLocation: "이마트 월드컵점",
//                totalPrice: 120000,
//                weightAndCount: .count,
//                amount: 10,
//                appointment: Party.Appointment(
//                    date: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
//                    time: Calendar.current.date(bySettingHour: 14, minute: 0, second: 0, of: Date()),
//                    location: "이마트 월드컵점 정문"
//                ),
//                description: "대용량 냉동식품을 나눠서 구매해요!\n만두, 치킨너겟, 냉동피자 등 다양한 제품 구매 예정입니다.",
//                comments: Array(PartyComment.sampleComments[5...6]),
//                chatURL: nil
//            )
//        ]
//    }
    
   
    // MARK: - Helper Methods
    private static func generateRandomAppointment(locations: [String]) -> Party.Appointment {
        let randomDate = Calendar.current.date(
            byAdding: .day,
            value: Int.random(in: 1...7),
            to: Date()
        )
        
        let randomTime = Calendar.current.date(
            bySettingHour: Int.random(in: 9...21),
            minute: [0, 30].randomElement()!,
            second: 0,
            of: Date()
        )
        
        return Party.Appointment(
            date: randomDate,
            time: randomTime,
            location: locations.randomElement()!
        )
    }
    
    // MARK: - Filtered Data
//    static var recruitingParties: [Party] {
//        return mockDataSet.filter { $0.status == .recruiting }
//    }
//    
//    static var inProgressParties: [Party] {
//        return mockDataSet.filter { $0.status == .inProgress }
//    }
//    
//    static var completedParties: [Party] {
//        return mockDataSet.filter { $0.status == .completed }
//    }
//    
//    // MARK: - Category Specific
//    static func parties(for category: FoodCategory) -> [Party] {
//        return mockDataSet.filter { $0.category == category }
//    }
//    
//    // MARK: - Price Range
//    static func parties(priceRange: ClosedRange<Int>) -> [Party] {
//        return mockDataSet.filter { priceRange.contains($0.totalPrice) }
//    }
}

// MARK: - Extensions for Enum Cases
//extension Party.PartyStatus: CaseIterable {
//    public static var allCases: [Party.PartyStatus] {
//        return [.recruiting, .inProgress, .completed]
//    }
//}
//
//extension Party.OrderType: CaseIterable {
//    public static var allCases: [Party.OrderType] {
//        return [.groupPurchase, .personalShopping]
//    }
//}
//
//extension Party.PurchaseChannel: CaseIterable {
//    public static var allCases: [Party.PurchaseChannel] {
//        return [.online, .offline]
//    }
//}
//
//extension Party.WeightAndCount: CaseIterable {
//    public static var allCases: [Party.WeightAndCount] {
//        return [.weight, .count]
//    }
//}
