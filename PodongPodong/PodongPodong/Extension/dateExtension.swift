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
    
    var timeAgo: String {
        let now = Date()
        let secondsAgo = Int(now.timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 30 * day
        
        if secondsAgo < minute {
            return "방금 전"
        }
        
        if secondsAgo < hour {
            let minutesAgo = secondsAgo / minute
            return "\(minutesAgo)분 전"
        }
        
        if secondsAgo < day {
            let hoursAgo = secondsAgo / hour
            return "\(hoursAgo)시간 전"
        }
        
        if secondsAgo < week {
            let daysAgo = secondsAgo / day
            if daysAgo == 1 {
                return "하루 전"
            } else {
                return "\(daysAgo)일 전"
            }
        }
        
        if secondsAgo < month {
            let weeksAgo = secondsAgo / week
            if weeksAgo == 1 {
                return "일주일 전"
            } else {
                return "\(weeksAgo)주 전"
            }
        }
        
        let monthsAgo = secondsAgo / month
        if monthsAgo == 1 {
            return "한 달 전"
        } else {
            return "\(monthsAgo)달 전"
        }
    }
}
