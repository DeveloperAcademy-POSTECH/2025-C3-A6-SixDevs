//
//  NotificationView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/9/25.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    //뒤로가기
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 16, height: 24)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                Text("알림")
                    .font(.pretendardBold18)
                Spacer()
                Button(action: {
                    // 설정으로 이동
                }){
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            VStack(spacing: 0){
                Notification(image: "circle", title: "반가와용!", description: "포동포동에 온 걸 환영해욤", date: "1")
            }
        }
    }
}

#Preview {
    NotificationView()
}
