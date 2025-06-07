//
//  PartyCreateViewModel.swift
//  PodongPodong
//
//  Created by 김서현 on 6/4/25.
//

import SwiftUI

struct PartyCreateViewModel: View {
    @State private var title: String=""
    @State private var selectOrderType=""
    @State private var selectCategoryType=""
    @State private var categories=["육류", "야채", "과일", "해산물", "기타"]
    @State var isCategorySelected=false
    
    var body: some View {
        VStack{
            Text("구매 방식")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            RadioButton(image:"person.2", label: "공동구매", description: "여러 명이 모여 더 싸게 구매할 수 있어요.", isSelected: selectOrderType=="공동구매"){
                selectOrderType="공동구매"
            }
            RadioButton(image: "cart.fill", label: "장보기", description: "함께 모여 오프라인 구매처에서 장을 볼 수 있어요.", isSelected: selectOrderType == "장보기"){
                selectOrderType="장보기"
            }
            Spacer()
                .frame(height:30)
            Text("제목")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            TextFieldView(
                text: .constant(""),
                placeholder: "제목을 입력해주세요")
            .frame(width: 361, height: 100)
            Spacer()
                .frame(height:30)
            Text("구매 카테고리")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            HStack{
                ForEach(categories, id:\.self){category in
                    SelectableChipButtonView(title: category, isSelected: $isCategorySelected, action: {isCategorySelected.toggle()})
                }
            } //:HSTACK
            Spacer()
                .frame(height:30)
            Text("모집 인원")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendardMedium16)
            
        } //: VSTACK
    }
}

#Preview {
    PartyCreateViewModel()
}
