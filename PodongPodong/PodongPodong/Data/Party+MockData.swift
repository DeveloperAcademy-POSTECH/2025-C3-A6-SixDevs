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
            chatURL: nil
        )
    }
}
