//
//  PartyCreateViewModel.swift
//  PodongPodong
//
//  Created by 김서현 on 6/4/25.
//

import SwiftUI

struct PartyCreateView: View {
    @State private var title: String = ""
    @State private var selectedOrder: OrderType = .groupPurchase
    @State private var selectedCategory: FoodCategory = .meat
    @State private var selectedPlace = ""
    @State private var selectUnit = ""
    @State private var partySize = 2 //참여 인원
    
    let categories = ["육류", "야채", "과일", "해산물", "기타"]
    let places = ["온라인", "오프라인"]
    let units = ["무게", "개수"]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 38){
                OrderTypeView(selectedOrderType: $selectedOrder)
                TitleView(title: $title)
                CategoryView(selectedCategory: $selectedCategory)
                partySizeView
                placeTypeView
//                if selectOrderType != "장보기"{priceView
//                    unitView}
                appointmentView
                descriptionView
            }
        }
    }
        
    // MARK: - partySizeView 모집 인원
    @ViewBuilder
    var partySizeView: some View{
        let minCount=2
        let maxCount=8
        VStack{
            Text("모집 인원")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            HStack(spacing: 12){
                Button(action: {if partySize > minCount{partySize -= 1}}){
                    Text("-")
                        .foregroundColor(partySize > minCount ? .black : Color.gray50)
                        
                }
                .padding(.leading, 12)
                .frame(width : 42, height: 36, alignment: .center)
                .font(Font.custom("Pretendard", size: 30))
                
                Text("\(partySize)명")
                    .font(.pretendardLight14)
                    .frame(width: 58, height: 36, alignment: .center)
                    .background(.white)
                    .overlay(
                        Rectangle()
                            .inset(by: 0.5)
                            .stroke(Color.gray50, lineWidth:1)
                    )
                Button(action: {if partySize < maxCount{partySize += 1}}){
                    Text("+")
                        .foregroundStyle(partySize < maxCount ? .black : Color.gray50)
                }
                .padding(.trailing, 12)
                .frame(width : 42, height: 36, alignment: .center)
                .font(Font.custom("Pretendard", size: 30))
            } //:HStack
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray50, lineWidth: 2))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 16)
        }
    }
        
    // MARK: - placeTypeView 구매처
    @ViewBuilder
    var placeTypeView: some View{
        VStack{
                Text("구매처")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .font(.pretendardMedium16)
                HStack(spacing: 12){
                    Spacer().frame(width:16)
                    ForEach(places, id: \.self) { place in
                        SelectableChipButtonView(
                            title: place,
                            isSelected: .constant(selectedPlace == place),
                            action: { selectedPlace = place }
                        )
                    }
                    Spacer()
                } //:HSTACK
                if selectedPlace == "온라인" {
                    TextFieldView(
                        text: .constant(""),
                        placeholder: "구매처 정보를 입력해주세요 (URL 등)"
                    ).frame(width: 361, height: 48)
                }
                else if selectedPlace == "오프라인" {
                    TextFieldView(
                        text: .constant(""),
                        placeholder: "구매처 정보를 입력해주세요 (장소명 등)"
                    ).frame(width: 361, height: 48)
                }
        // TODO: 장보기 선택했을 때 구매처 오프라인으로 고정
        } //: VSTACK
    }
        
    // MARK: - priceView 구매 비용
    @ViewBuilder
    var priceView: some View {
        VStack{
            Text("구매 비용")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            TextFieldView(
                text: .constant(""),
                placeholder: "총 구매 비용을 입력해주세요.",
                suffixText: "원"
            ).frame(width: 361, height: 48)
        }
    } //: priceView
    
    // MARK: - unitView 구매 단위
    @ViewBuilder
    var unitView: some View {
        VStack{
            Text("구매 단위")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            HStack(spacing: 12){
                Spacer().frame(width:16)
                ForEach(units, id: \.self) { unit in
                    SelectableChipButtonView(
                        title: unit,
                        isSelected: .constant(selectUnit == unit),
                        action: { selectUnit = unit }
                    )
                }
                Spacer()
            } //: HSTACK
            if selectUnit != ""{
                TextFieldView(
                    text: .constant(""),
                    placeholder: "\(selectUnit)를 입력해주세요",
                    suffixText: selectUnit=="무게" ? "g" : "개"
                ).frame(width: 361, height: 48)
            }//: IF
        }//: VSTACK
    }
        
    // MARK: - appointmentView
    @ViewBuilder
    var appointmentView: some View {
        VStack{
            Text("약속 (선택)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            // TODO: 날짜, 시간, 장소 로직 입력
            TextFieldView(
                text: .constant(""),
                placeholder: "날짜를 입력해주세요",
                icon: Image(systemName: "calendar")
            ).frame(width: 361, height: 44)
            TextFieldView(
                text: .constant(""),
                placeholder: "만날 시간을 정해주세요",
                icon: Image(systemName: "clock")
            ).frame(width: 361, height: 44)
            TextFieldView(
                text: .constant(""),
                placeholder: "만날 장소를 정해주세요",
                icon: Image(systemName: "mappin")
                // TODO: 이거 아이콘 이름 변경
            ).frame(width: 361, height: 44)
        }
    }
        
    // MARK: - descriptionView 설명(선택)
    @ViewBuilder
    var descriptionView: some View {
        VStack{
            Text("설명 (선택)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .font(.pretendardMedium16)
            Text("이런 내용을 적어보세요\n-가이드라인 1\n-가이드라인2\n-가이드라인3")
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .padding(.trailing, 152)
                .frame(width: 361)
                .background(Color.gray10)
                .foregroundColor(Color.gray70)
                .font(.pretendardMedium16)
                
                
            // TODO: 멀티라인 입력 처리하기
            TextFieldView(
                text: .constant(""),
                placeholder: "파티를 어떻게 운영할 것인지에 대한 구체적인 정보를 적어주세요.").frame(width: 361, height: 244)
        } //: VSTACK
    }
}

// TODO: 필수항목 선택항목 로직 추가해야함 (필수 항목 입력 안 하면 안 넘어가게)
#Preview {
    PartyCreateView()
}
