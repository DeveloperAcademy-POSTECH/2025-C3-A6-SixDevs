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
                .foregroundStyle(Color.gray40)

            HStack {
                AppointmentInfoView(
                    icon: "calendar",
                    info: party.appointment.date ?? "미정"
                )

                AppointmentInfoView(
                    icon: "clock",
                    info: party.appointment.time ?? "미정"
                )

                AppointmentInfoView(
                    icon: "location.circle",
                    info: party.appointment.location ?? "미정"
                )
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
                .lineLimit(1)
                .minimumScaleFactor(8 / 15)
        }
        .padding(.trailing, 25)
    }
}

#Preview {
    PartyDetailAppointmentView(party: Party.sampleData)
}
