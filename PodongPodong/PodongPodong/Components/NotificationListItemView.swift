//
//  Notification.swift
//  PodongPodong
//
//  Created by 김서현 on 6/9/25.
//

import SwiftUI
// TODO: 확인하지 않은 알림은 배경 노란색으로 표시?
struct NotificationListItemView: View {
    let image: String
    let title: String
    let description: String
    let date: String
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42)
                .cornerRadius(12)
                .padding(.leading, 16)
                .padding(.top, 16)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.pretendardBold16)
                Text(description)
                    .font(.pretendardSemibold14)
                    .foregroundStyle(Color.gray80)
                    .fixedSize(horizontal: false, vertical: true)
                Text("\n\(date)일 전")
                    .font(.pretendardSemibold14)
                    .foregroundStyle(Color.gray50)
            }
            .padding(.vertical, 16)
            .padding(.trailing, 16)
            
        } //: HSTACK
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.primaryLight1)
        .clipShape(Rectangle())
    }
}

#Preview {
    NotificationListItemView(image: "circle.fill", title: "입금 여부를 확인해주세요", description: "\"냉장 삼겹살 3kg 파티원 모집\" 파티원들이 모두 입금했어요. 입금 여부를 확인해주세요.", date: "2")
    NotificationListItemView(image: "circle.fill", title: "입금 여부를 확인해주세요", description: "입금 여부를 확인해주세요.", date: "2")
    NotificationListItemView(image: "circle.fill", title: "입금 여부를 확인해주세요", description: "\"냉장 삼겹살 3kg 파티원 모집\" 파티원들이 모두 입금했어요. 입금 여부를 확인해주세요.", date: "2")
    Spacer()
}
