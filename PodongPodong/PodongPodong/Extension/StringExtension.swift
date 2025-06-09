//
//  stringExtension.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import SwiftUI

extension String {
    func limitTo(_ count: Int) -> String {
        return self.count > count ? String(self.prefix(count)) + "..." : self
    }
    
    func toDate(format: String = "yyyy년 MM월 dd일") -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    func toTime(format: String = "a h시 mm분") -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
