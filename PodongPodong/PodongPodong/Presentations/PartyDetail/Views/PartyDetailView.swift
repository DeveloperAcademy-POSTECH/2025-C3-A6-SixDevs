//
//  PartyDetailView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/2/25.
//

import SwiftUI

struct PartyDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: PartyDetailViewModel

    let currentUser: User

    init(partyID: String, currentUser: User) {
        self._viewModel = StateObject(
            wrappedValue: PartyDetailViewModel(partyID: partyID)
        )
        self.currentUser = currentUser
    }

    // MARK: - Main Content
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear.ignoresSafeArea()

            if viewModel.isLoading {
                Text("Loading...")
            } else if let party = viewModel.party {
                ScrollView() {
                    VStack(alignment: .leading, spacing: 30) {
                        PartyDetailHeaderView(party: party, viewModel: viewModel)
                        PartyDetailContentView(party: party)
                        PartyDetailAppointmentView(party: party)

                        PartyDetailParticipantView(
                            party: party,
                            currentUser: currentUser,
                            viewModel: viewModel
                        )
                        PartyDetailCommentView(
                            party: party,
                            currentUser: currentUser,
                            comments: viewModel.comments,
                            viewModel: viewModel
                        )
                        Spacer().frame(height: 50)
                    }
                    .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    navigationToolbarItems
                }

                PartyDetailBottomView(party: party, currentUser: currentUser, viewModel: viewModel)
                    .frame(height: 30)
                    .padding()
                    .padding(.bottom, 10)
                    .background(Color.white)
            }
        }
        .task {
            await viewModel.fetchPartyDetail()
        }
        .alert("오류", isPresented: $viewModel.showError) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "알 수 없는 오류가 발생했습니다.")
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
        PartyDetailView(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B",
            currentUser: User.sampleHost
        )
    }

}
