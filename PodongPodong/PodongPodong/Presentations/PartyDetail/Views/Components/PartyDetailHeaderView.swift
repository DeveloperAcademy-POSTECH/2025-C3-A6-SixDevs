//
//  PartyDetailHeaderView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import SwiftUI

struct PartyDetailHeaderView: View {
    let party: Party
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleSection
            statisticsSection
            Divider()
                .padding(.top, 10)
        }
    }
    
    // MARK: - Title Section
    private var titleSection: some View {
        Text(party.title)
            .font(.pretend(type: .bold, size: 20))
            .padding(.bottom, 24)
    }
    
    // MARK: - Statistics Section
    private var statisticsSection: some View {
        HStack {
            Text("32분 전")
            Spacer()
            Text("조회 \(party.viewCount)")
            Text("관심 \(party.likeCount)")
            Text("댓글 \(party.comments.count)")
        }
        .font(.pretend(type: .semibold, size: 12))
        .foregroundStyle(Color.gray60)
    }
}

#Preview {
    PartyDetailHeaderView(party: Party.sampleData)
}
