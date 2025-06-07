//
//  Int64Extension.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/5/25.
//

import Foundation

extension Int64 {
    func toChatTimeString() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self) / 1000)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR") // 한글 오전/오후
        formatter.dateFormat = "a h:mm"
        return formatter.string(from: date)
    }
}
