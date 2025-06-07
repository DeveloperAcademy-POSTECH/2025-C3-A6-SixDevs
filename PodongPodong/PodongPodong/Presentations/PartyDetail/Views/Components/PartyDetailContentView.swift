//
//  PartyDetailContentView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import SwiftUI

struct PartyDetailContentView: View {
    let party: Party

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
            InfoRowView(title: "카테고리", info: party.category.displayName)
            // 추후 기능 구현 단계에서 가겨 변환 로직 구현
            InfoRowView(title: "예상 가격", info: "100g당 3,500원")
            InfoRowView(title: "모집 인원", info: "\(party.recruitmentCount)명")
        }
    }

    // MARK: - Description Section
    private var descriptionSection: some View {
        Group {
            if let description = party.description, !description.isEmpty {
                Text(description)
                    .font(.pretend(type: .medium, size: 16))
                    .lineHeight(1.25, fontSize: 16)
            }
        }
    }

    // MARK: - Purchase Section
    private var purchaseSection: some View {
        VStack {
            if party.purchaseChannel == .online {
                onlinePurchaseSection
            } else {
                offlinePurchaseSection
            }
        }
    }

    // MARK: - Online Purchase Section
    private var onlinePurchaseSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("온라인 구매")
                .font(.pretend(type: .medium, size: 14))
                .foregroundStyle(Color.gray60)
            
            if let url = URL(string: party.purchaseLocation) {
                Label {
                    Link(
                        party.purchaseLocation.limitTo(35),
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
                Text(party.purchaseLocation.limitTo(20))
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
    PartyDetailContentView(party: Party.sampleData)
}
