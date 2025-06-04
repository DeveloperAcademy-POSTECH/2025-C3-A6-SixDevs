//
//  RadioButton.swift
//  MyPodong
//
//  Created by 김서현 on 6/3/25.
//

import SwiftUI

struct RadioButton: View {
    let image: String
    let label: String
    let description: String
    let isSelected: Bool
    let action: ()->Void
    
    var body: some View {
        Button(action: action){
            HStack{
                Spacer()
                    .frame(width:16)
                Image(systemName: image)
                Spacer()
                    .frame(width:12)
                VStack{
                    HStack{
                        Text(label)
                            .font(
                            Font.custom("Pretendard", size: 16)
                            .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.54, green: 0.54, blue: 0.54))
                            .frame(width: 73, height:22, alignment: .leading)
                        Spacer()
                    }
                    HStack{
                        Text(description)
                            .font(
                            Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.54, green: 0.54, blue: 0.54))
                        Spacer()
                    }
                }
                Circle()
                    .strokeBorder(isSelected ? Color(red:1, green:0.84, blue:0.47) : Color.white, lineWidth: 5)
                    .background(Circle().fill(Color.white))
                    .frame(width:26 , height:26)
                Spacer()
            }
        }//button의 끝
        .frame(width: 361, height: 82)
        .buttonStyle(.plain)
        .background(isSelected ? Color(red: 1, green: 0.98, blue: 0.93) : .white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Color(red:1, green: 0.84, blue: 0.47) : Color(red: 0.67, green:0.67, blue: 0.67), lineWidth: 2)
        )

        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


#Preview {
    RadioButton(image: "person.2", label: "공동구매", description: "여러 명이 모여 더 싸게 구매할 수 있어요.", isSelected: true){
        //action
    }
}
