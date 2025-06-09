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
    let currentUser: User = DummyData.user
    @StateObject private var viewModel: PartyDetailViewModel = PartyDetailViewModel(partyID: "")


    // MARK: - Main Content
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear.ignoresSafeArea()

            if viewModel.isLoading {
                Text("Loading...")
            } else if let party = viewModel.party {
                ScrollView() {
                    VStack(alignment: .leading, spacing: 30) {
                        PartyDetailHeaderView(viewModel: viewModel, party: party)
                        PartyDetailContentView(party: party)
                        PartyDetailAppointmentView(party: party)

                        PartyDetailParticipantView(
                            viewModel: viewModel,
                            party: party
                        )
                        PartyDetailCommentView(
                            viewModel: viewModel,
                            party: party
                        )
                        Spacer().frame(height: 50)
                    }
                    .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    navigationToolbarItems
                }

                PartyDetailBottomView(viewModel: viewModel)
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
        PartyDetailView(party: Party.sampleData)
    }
}
