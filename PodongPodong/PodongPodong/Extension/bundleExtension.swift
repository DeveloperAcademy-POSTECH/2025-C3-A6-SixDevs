//
//  bundleExtension.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/2/25.
//
import Foundation

extension Bundle {
    var sendbirdAppId: String {
        return infoDictionary?["SendbirdAppId"] as? String ?? ""
    }
    
    var testChannel: String {
        return infoDictionary?["TestChannel"] as? String ?? ""
    }

}


