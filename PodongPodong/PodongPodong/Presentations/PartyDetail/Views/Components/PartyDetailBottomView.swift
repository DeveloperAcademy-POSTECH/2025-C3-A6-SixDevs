//
//  PartyDetailBottomView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/5/25.
//

import SwiftUI

struct PartyDetailBottomView: View {
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
                .fill(viewModel.viewConfiguration.actionButtonColor)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .overlay {
                    Text(viewModel.viewConfiguration.actionButtonTitle)
                        .font(.pretend(type: .semibold, size: 18))
                        .foregroundStyle(viewModel.viewConfiguration.actionButtonTextColor)
                }
        }
        .disabled(!viewModel.viewConfiguration.isActionButtonEnabled)
    }
}

#Preview {
    PartyDetailBottomView(
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        )
    )
}
