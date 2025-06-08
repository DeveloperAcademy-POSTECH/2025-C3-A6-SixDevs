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
}
