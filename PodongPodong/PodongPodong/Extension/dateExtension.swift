//
//  dataExtension.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import Foundation

extension Date {
    var mmdd: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        return formatter.string(from: self)
    }
}
