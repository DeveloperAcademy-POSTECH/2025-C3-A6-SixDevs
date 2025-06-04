//
//  dataExtension.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation

extension Date {
    var md: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일"
        return formatter.string(from: self)
    }
}
