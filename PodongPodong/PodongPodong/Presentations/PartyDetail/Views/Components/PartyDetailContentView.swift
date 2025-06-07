//
//  PartyDetailContentView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import SwiftUI

struct PartyDetailContentView: View {
    @ObservedObject var viewModel: PartyDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            infoSection
            descriptionSection
            purchaseSection
        }
    }

    // MARK: - Info Section
    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            InfoRowView(title: "카테고리", info: viewModel.categoryDisplayName)
            // TODO: 가격 변환 로직 추가
            InfoRowView(title: "예상 가격", info: "100g당 3,500원")
            InfoRowView(title: "모집 인원", info: "\(viewModel.recruitmentCount)명")
        }
    }

    // MARK: - Description Section
    private var descriptionSection: some View {
        Text(viewModel.partyDescription)
            .font(.pretend(type: .medium, size: 16))
            .lineHeight(1.25, fontSize: 16)
    }

    // MARK: - Purchase Section
    @ViewBuilder
    private var purchaseSection: some View {
        if viewModel.isOnlinePurchase {
            onlinePurchaseSection
        } else {
            offlinePurchaseSection
        }
    }

    // MARK: - Online Purchase Section
    private var onlinePurchaseSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("온라인 구매")
                .font(.pretend(type: .medium, size: 14))
                .foregroundStyle(Color.gray60)

            if let url = URL(string: viewModel.purchaseLocation) {
                Label {
                    Link(
                        viewModel.limitedPurchaseLocation(limit: 35),
                        destination: url
                    )
                    .font(.pretend(type: .medium, size: 15))
                } icon: {
                    Image(systemName: "link")
                        .font(.pretend(type: .regular, size: 14))
                }
            } else {
                Text("구매처 정보 없음")
                    .font(.pretend(type: .medium, size: 15))
                    .foregroundStyle(Color.gray40)
            }
        }
    }

    // MARK: - Offline Purchase Section
    private var offlinePurchaseSection: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text("오프라인 구매")
                .font(.pretend(type: .medium, size: 14))
                .foregroundStyle(Color.gray60)

            Label {
                Text(viewModel.limitedPurchaseLocation(limit: 35))
                    .font(.pretend(type: .medium, size: 15))
            } icon: {
                Image(systemName: "link")
                    .font(.pretend(type: .regular, size: 14))
            }
        }
    }
}

// MARK: - InfoRowView
private struct InfoRowView: View {
    let title: String
    let info: String

    init(title: String, info: String) {
        self.title = title
        self.info = info
    }

    var body: some View {
        HStack(spacing: 15) {
            Text(title)
                .font(.pretend(type: .medium, size: 14))
                .foregroundStyle(Color.gray40)

            Text(info)
                .font(.pretend(type: .medium, size: 16))
        }
    }
}

#Preview {
    PartyDetailContentView(
        viewModel: PartyDetailViewModel(
            partyID: "AF4C9D32-32D7-4FF0-8FD7-D702A7E4A58B"
        )
    )
}
