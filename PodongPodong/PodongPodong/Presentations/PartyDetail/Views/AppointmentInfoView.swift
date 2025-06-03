//
//  PromiseView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/3/25.
//

import SwiftUI

struct AppointmentInfoView: View {
    let icon: String
    let info: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.pretend(type: .medium, size: 18))
            
            Text(info)
                .font(.pretend(type: .medium, size: 15))
        }
        .padding(.trailing, 32)
    }
}

#Preview {
    AppointmentInfoView(icon: "calendar", info:"4월 19일")
}
