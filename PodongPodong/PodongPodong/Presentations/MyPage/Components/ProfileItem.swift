//
//  ProfileItem.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/11/25.
//

import SwiftUI

struct ProfileItem: View {
    let image: String
    
    var body: some View {
        Image(image)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProfileItem(image: "profileImage1")
}
