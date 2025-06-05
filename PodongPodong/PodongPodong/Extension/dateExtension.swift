//
//  dataExtension.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation

extension Date {
    var formattedMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "MM월dd일"
        return dateFormatter.string(from: self)
    }

    var formattedHour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "a h시"
        return dateFormatter.string(from: self)
      
    var mmdd: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        return formatter.string(from: self)
    }
}
