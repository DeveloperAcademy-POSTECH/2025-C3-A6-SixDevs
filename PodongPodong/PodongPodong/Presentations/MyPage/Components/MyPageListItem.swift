//
//  MyPageListItem.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/9/25.
//

import SwiftUI

struct MyPageListItem: View {
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("\(title)")
                .font(.pretendardBold18)
                .foregroundStyle(Color.black)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MyPageListItem(title: "내가 받은 후기") { }
}
