//
//  PartyDetailView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/2/25.
//

import SwiftUI

struct PartyDetailView: View {
    @Environment(\.dismiss) private var dismiss
    private let party: Party
    private let currentUser: User

    init(
        party: Party = Party.sampleData,
        currentUser: User = User.sampleUsers[0]
    ) {
        self.party = party
        self.currentUser = currentUser
    }

    // MARK: - Main Content
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    headerView
                    contentView
                    appointmentView
                    participantListView
                    commentListView
                    bottomButtonView
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                navigationToolbarItems
            }
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

    private var headerView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(party.title)
                .font(.pretend(type: .bold, size: 20))
                .padding(.bottom, 24)

            HStack {
                Text("32분 전")
                Spacer()
                Text("조회 100")
                Text("관심 4")
                Text("댓글 42")
            }
            .font(.pretend(type: .semibold, size: 12))
            .foregroundStyle(.secondary)

            Divider()
                .padding(.top, 10)
        }
    }

    private var contentView: some View {
        VStack(alignment: .leading, spacing: 20) {
            InfoRowView(title: "카테고리", info: party.category.displayName)
            InfoRowView(title: "예상 가격", info: "100g당 3,500원")
            InfoRowView(
                title: "모집 인원",
                info: "\(String(party.recruitmentCount))명"
            )
            if let description = party.description {
                Text(
                    party.description!
                )
                .font(.pretend(type: .medium, size: 16))
                .lineHeight(1.25, fontSize: 16)
            } else {
                Text("")
            }
            
            

            VStack(alignment: .leading, spacing: 8) {
                Text("온라인 구매")
                    .font(.pretend(type: .medium, size: 14))
                    .foregroundStyle(.gray04)

                if let url = URL(string: party.purchaseLocation) {
                    Label {
                        Link(
                            party.purchaseLocation.limitTo(25),
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
                        .foregroundStyle(.gray04)
                }
            }
            .padding(.top, 20)

        }
    }

    private var appointmentView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("약속")
                .font(.pretend(type: .medium, size: 14))
                .foregroundStyle(.gray04)

            HStack {
                // 날짜, 시간 선택 기능 구현 후 수정 예정
                AppointmentInfoView(
                    icon: "calendar",
                    info: Date().formattedMonthDay
                )
                AppointmentInfoView(icon: "clock", info: Date().formattedHour)
                if let location = party.appointment.location {
                    AppointmentInfoView(
                        icon: "location.circle",
                        info: location
                    )
                }
                
                
            }
        }
    }

    private var participantListView: some View {
        VStack {
            HStack {
                Text("참여 인원(\(party.member.count))")
                    .foregroundStyle(.second)
                    .font(.pretend(type: .bold, size: 16))

                Spacer()

                Button {

                } label: {
                    Text("채팅방")
                    Image(systemName: "chevron.right")
                }
                .font(.pretend(type: .semibold, size: 14))
                .foregroundStyle(.second)
            }

            ParticipantMemberView(
                host: party.writen,
                members: party.member,
                waitingMembers: party.waitingMembers
            )

            Rectangle()
                .frame(height: 6)
                .foregroundStyle(.participantMemberBackground)
                .padding(.top, 20)
        }
    }

    private var commentListView: some View {
        VStack(spacing: 23) {
            HStack {
                Text("댓글(\(party.comments.count))")
                    .foregroundStyle(.second)
                    .font(.pretend(type: .bold, size: 16))

                Spacer()

                Button {

                } label: {
                    Text("전체보기")
                    Image(systemName: "chevron.right")
                }
                .font(.pretend(type: .semibold, size: 14))
                .foregroundStyle(.second)
            }
            CommentView(
                userName: "삼겹살만취급함",
                commentText: "상처투성이의 손을 맞잡고 다시 비틀비틀 짝짜꿍",
                createdAt: "2일전"
            )
            CommentView(
                userName: "삼겹살만취급함",
                commentText: "상처투성이의 손을 맞잡고 다시 비틀비틀 짝짜꿍",
                createdAt: "2일전"
            )
        }
    }

    private var bottomButtonView: some View {
        HStack {
            Image(systemName: "heart")
                .font(.system(size: 36, weight: .regular))

            RoundedRectangle(cornerRadius: 12)
                .fill(.main)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .overlay {
                    Text("파티 마감하기")
                        .font(.pretend(type: .semibold, size: 18))
                }
        }
        .padding(.top, 30)
    }
}

#Preview {
    NavigationStack {
        PartyDetailView()
    }

}
