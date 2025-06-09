//
//  AppointmentView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct AppointmentView: View {
        @Binding var selectedDate: String
        @Binding var selectedTime: String
        @Binding var selectedPlace: String
        
        var body: some View {
            VStack{
                Text("약속 (선택)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                // TODO: 날짜, 시간, 장소 로직 입력
                TextFieldView(
                    text: $selectedDate,
                    placeholder: "날짜를 입력해주세요",
                    icon: Image(systemName: "calendar")
                ).frame(width: 361, height: 44)
                TextFieldView(
                    text: $selectedTime,
                    placeholder: "만날 시간을 정해주세요",
                    icon: Image(systemName: "clock")
                ).frame(width: 361, height: 44)
                TextFieldView(
                    text: $selectedPlace,
                    placeholder: "만날 장소를 정해주세요",
                    icon: Image(systemName: "mappin")
                    // TODO: 이거 아이콘 이름 변경
                ).frame(width: 361, height: 44)
            }
        }
    }
}

#Preview {
    PartyCreateView.AppointmentView(
        selectedDate: .constant(""),
        selectedTime: .constant(""),
        selectedPlace: .constant(""))
}
