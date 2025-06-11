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
    @StateObject private var viewModel: PartyDetailViewModel

    @State private var showingMoreOptions = false
    @State private var showingDeleteAlert = false
    @State private var showingEditView = false

    init(party: Party) {
        self.party = party
        self._viewModel = StateObject(
            wrappedValue: PartyDetailViewModel(partyID: party.id.uuidString)
        )
    }

    // MARK: - Main Content
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear.ignoresSafeArea()

            ScrollView {
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
            .alert("파티 삭제", isPresented: $showingDeleteAlert) {
                Button("취소", role: .cancel) {}
                Button("삭제", role: .destructive) {
                    Task {
                        await viewModel.deleteParty()
                    }

                }
            } message: {
                Text("정말로 이 파티를 삭제하시겠습니까?\n삭제된 파티는 복구할 수 없습니다.")
            }
            .navigationDestination(isPresented: $showingEditView) {
                if let currentParty = viewModel.party {
                    PartyCreateView(party: currentParty)
                        .onDisappear() {
                            Task {
                                await viewModel.refreshPartyDetail()
                            }
                        }
                }
            }

            PartyDetailBottomView(viewModel: viewModel)
                .frame(height: 30)
                .padding()
                .padding(.bottom, 10)
                .background(Color.white)

        }
        .refreshable {
            await viewModel.fetchPartyDetail()
        }
        .alert("오류", isPresented: $viewModel.showError) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "알 수 없는 오류가 발생했습니다.")
        }
        .task {
            await viewModel.fetchPartyDetail()
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
            if viewModel.isHost {
                moreOptionsButton
            }
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

    // 호스트만 볼 수 있게
    private var moreOptionsButton: some View {
        Menu {
            Button {
                handleEditParty()
            } label: {
                Label("파티 수정하기", systemImage: "square.and.pencil")
            }

            Button(role: .destructive) {
                showingDeleteAlert = true
            } label: {
                Label("파티 삭제하기", systemImage: "trash")
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundStyle(.black)
        }
    }
    
    private func handleEditParty() {
        showingEditView = true
    }
    
}

#Preview {
    NavigationStack {
        PartyDetailView(party: Party.sampleData)
    }
}
