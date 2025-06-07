//
//  PartyDetailBottomView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/5/25.
//

import SwiftUI

struct PartyDetailBottomView: View {
    let party: Party
    let currentUser: User
    @ObservedObject var viewModel: PartyDetailViewModel

    var body: some View {
        HStack {
            likeButton
            actionButton
        }
        .padding(.top, 30)
    }

    //MARK: - Like Button
    private var likeButton: some View {
        Button {
            Task {
                await viewModel.toggleLike()
            }

        } label: {
            Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                .font(.system(size: 36, weight: .regular))
                .foregroundStyle(viewModel.isLiked ? .red : .black)
        }
    }

    //MARK: - Action Button
    private var actionButton: some View {
        Button {
            Task {
                await viewModel.handleMainActionButton()
            }
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .fill(buttonColor)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .overlay {
                    Text(buttonTitle)
                        .font(.pretend(type: .semibold, size: 18))
                        .foregroundStyle(textColor)
                }
        }
        .disabled(shouldDisableButton)
    }

    private var buttonColor: Color {
        switch viewModel.currentUserRole {
        case .host:
            return viewModel.party?.status == .inProgress
                ? Color.red00
                : (viewModel.party?.status == .completed
                    ? Color.gray20 : Color.primaryColor)
        case .member:
            return viewModel.party?.status == .inProgress
                ? Color.gray20 : Color.red00
        case .waitingMember:
            return viewModel.party?.status == .inProgress
                ? Color.gray20 : Color.red00
        case .guest:
            return viewModel.party?.status == .inProgress
                ? Color.gray20 : Color.primaryColor
        }
    }

    private var textColor: Color {
        switch viewModel.currentUserRole {
        case .host:
            return viewModel.party?.status == .inProgress
            ? Color.red10
            : (viewModel.party?.status == .completed
                ? Color.gray60 : Color.secondary)
        case .member:
            return viewModel.party?.status == .inProgress
                ? Color.gray60 : Color.red10
        case .waitingMember:
            return viewModel.party?.status == .inProgress
                ? Color.gray60 : Color.red10
        case .guest:
            return viewModel.party?.status == .inProgress
                ? Color.gray60 : Color.secondary
        }
    }

    private var shouldDisableButton: Bool {
        !viewModel.isHost && viewModel.party?.status != .recruiting
    }

    private var buttonTitle: String {
        // 호스트의 경우 버튼 상태변화: 모집 마감 -> 공구 완료 -> 공구가 마감되었습니다.
        if viewModel.isHost && viewModel.party?.status == .recruiting {
            return "파티 마감하기"
        } else if viewModel.isHost && viewModel.party?.status == .inProgress {
            return "공구 종료하기"
        } else if viewModel.isHost && viewModel.party?.status == .completed {
            return "종료된 파티"
        } else if viewModel.isParticipant {
            return "파티 탈퇴하기"
        } else if viewModel.isWaitingMember {
            return "참여 신청취소"
        } else if viewModel.party?.status == .recruiting {
            return "참여 신청하기"
        } else {
            return "모집이 마감되었습니다"
        }
    }
}

#Preview {
    PartyDetailBottomView(
        party: Party.sampleData,
        currentUser: User.sampleCurrentUser,
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        )
    )
}
