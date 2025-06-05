//
//  PartyDetailView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/2/25.
//

import SwiftUI

struct PartyDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let party: Party
    let currentUser: User

    // MARK: - Main Content
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    PartyDetailHeaderView(party: party)
                    PartyDetailContentView(party: party)
                    PartyDetailAppointmentView(party: party)
                    PartyDetailParticipantView(party: party, currentUser: currentUser)
                    PartyDetailCommentView(party: party, currentUser: currentUser)
                    Spacer().frame(height: 50)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                navigationToolbarItems
            }
            
            PartyDetailBottomView(party: party, currentUser: currentUser)
                .frame(height: 30)
                .padding()
                .padding(.bottom, 10)
                .background(Color.white)
        }
    }

    // MARK: - Navigation Toolbar
    @ToolbarContentBuilder
    private var navigationToolbarItems: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            backButton
        }

        ToolbarItem(placement: .principal) {
            navigationTitle
        }

        ToolbarItem(placement: .topBarTrailing) {
            moreOptionsButton
        }
    }

    // MARK: - Toolbar 컴포넌트
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.black)
        }
    }

    private var navigationTitle: some View {
        Text("파티 상세 보기")
            .font(.pretend(type: .bold, size: 18))
    }

    private var moreOptionsButton: some View {
        Button {
            // 더보기 액션 추가 예정
        } label: {
            Image(systemName: "ellipsis")
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    NavigationStack {
        PartyDetailView(party: Party.sampleData, currentUser: User.sampleCurrentUser)
    }

}
