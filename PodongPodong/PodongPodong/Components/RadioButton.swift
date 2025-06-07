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
                            .font(.pretendardMedium16)
                            .foregroundColor(Color.gray60)
                            .frame(width: 73, height:22, alignment: .leading)
                        Spacer()
                    }
                    HStack{
                        Text(description)
                            .font(.pretendardRegular12)
                            .foregroundColor(Color.gray60)
                        Spacer()
                    }
                }
                Circle()
                    .strokeBorder(isSelected ? Color.primaryColor : Color.white, lineWidth: 7)
                    .background(Circle().fill(Color.white))
                    .frame(width:26 , height:26)
                Spacer()
            }
        }//button의 끝
        .frame(width: 361, height: 82)
        .buttonStyle(.plain)
        .background(isSelected ? Color.primaryLight1 : .white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Color.primaryColor : Color.gray50, lineWidth: 2)
        )

        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


#Preview {
    RadioButton(image: "person.2", label: "공동구매", description: "여러 명이 모여 더 싸게 구매할 수 있어요.", isSelected: true){
        //action
    }
}
