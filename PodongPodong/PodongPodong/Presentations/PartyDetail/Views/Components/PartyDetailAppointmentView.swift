//
//  PartyDetailAppointmentView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import SwiftUI

struct PartyDetailAppointmentView: View {
    let party: Party

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("약속")
                .font(.pretend(type: .medium, size: 14))
                .foregroundStyle(.gray04)

            HStack {
                // 날짜, 시간 선택 기능 구현 후 수정 예정
                // 각 영역별로 선택 안하는 경우 "미정"이라고 텍스트 대체하기
                if party.appointment.date != nil {
                    AppointmentInfoView(
                        icon: "calendar",
                        info: Date().formattedMonthDay
                    )
                }

                if party.appointment.time != nil {
                    AppointmentInfoView(
                        icon: "clock",
                        info: Date().formattedHour
                    )
                }

                if let location = party.appointment.location {
                    AppointmentInfoView(
                        icon: "location.circle",
                        info: location
                    )
                }
            }
        }
    }
}

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
        .padding(.trailing, 25)
    }
}

#Preview {
    PartyDetailAppointmentView(party: Party.sampleData)
}
