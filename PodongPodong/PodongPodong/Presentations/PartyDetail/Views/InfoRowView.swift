//
//  SwiftUIView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import SwiftUI

struct InfoRowView: View {
    let title: String
    let info: String
    
    init(title: String, info: String) {
        self.title = title
        self.info = info
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Text(title)
                .font(.pretend(type: .medium, size: 14))
                .foregroundStyle(.gray04)
                
            
            
            Text(info)
                .font(.pretend(type: .medium, size: 16))
        }
    }
}

#Preview {
    InfoRowView(title: "카테고리", info: "육류")
}
