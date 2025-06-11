//
//  PartyListItem.swift
//  PodongPodong
//
//  Created by 김민석 on 6/5/25.
//

import SwiftUI

struct PartyListItem: View {
    let party: Party
    // TODO: - 유저 받아오기
    let user = DummyData.user
    
    var body: some View {
        VStack {
            // MARK: 상단(제목, 생성시간)
            HStack {
                Text(party.title)
                    .font(.pretendardSemibold20)
                
                Spacer()
                
                Text(party.createdAt.timeAgo)
                    .font(.pretendardMedium14)
                    .foregroundColor(.gray70)
                    .offset(y: 5)
            }
            
            Spacer().frame(height: 6)
            
            // MARK: 중간(카테고리, 구매처)
            Text("\(party.category.displayName)  ·  \(party.purchaseChannel.displayName)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendardMedium14)
                .foregroundColor(.gray70)
            
            Spacer().frame(height: 20)
            
            // MARK: 하단(g당 가격, 참여 여부, 인원)
            HStack {
                Text("\(amount)\(party.weightAndCount.displayName)당 \(price)원")
                    .font(.pretendardSemibold14)
                    .foregroundColor(.gray80)
                    .offset(x: 2)
                
                Spacer()
                
                if let status = myPartyStatus {
                    MyPartyStatusCapsuleView(myPartyStatus: status)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)

                    Text("\(party.member.count+1)/\(party.recruitmentCount)")
                        .font(.pretendardMedium14)
                        .foregroundColor(.gray80)
                }
            }
            
        }
        .padding(12)
        .frame(height: 110)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray20, lineWidth: 1)
        )
    }
}

extension PartyListItem{
    private var amount: Int {
        party.amount / party.recruitmentCount
    }
    
    private var price: Int {
        party.totalPrice / party.recruitmentCount
    }
    
    private var myPartyStatus: MyPartyStatus? {
        if party.waitingMembers.contains(where: { $0.id == user.id} ) { return .waiting }
        if party.member.contains(where: { $0.id == user.id} ) { return .joined }
        if party.writen.id == user.id { return .created }
        
        return nil
    }
}

#Preview {
    PartyListItem(party: DummyData.partyGroup1)
    //PartyListView()
}
