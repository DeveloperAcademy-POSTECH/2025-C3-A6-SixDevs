//
//  PartyDetailView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/2/25.
//

import SwiftUI

struct PartyDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let url =
        "https://www.coupang.com/vp/products/8610671752?itemId=24974313286&vendorItemId=89950890066&q=%EB%83%89%EC%9E%A5+%EC%82%BC%EA%B2%B9%EC%82%B4+3kg&searchId=1b712c091551834&sourceType=search&itemsCount=36&searchRank=1&rank=1"

    private var participantMemberNumber = 3
    private var commentNumber = 42

    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                Color.clear.ignoresSafeArea()

                // 보여지는 뷰
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
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text("파티 상세 보기")
                        .font(.pretend(type: .bold, size: 18))
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {

                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.black)
                    }

                }
            }
        }
    }

    private var headerView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("냉장 삼겹살 3kg 파티원 모집")
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
            InfoRowView(title: "카테고리", info: "육류")
            InfoRowView(title: "예상 가격", info: "100g당 3,500원")
            InfoRowView(title: "모집 인원", info: "6명")

            Text(
                "냉장 삼겹살 공구하실 분 모집합니다\n한분 당 1kg에 약 5800원으로 저렴하게 구매하실 수 있어요\n\n냉동보다는 냉장이 확실히 퀄리티가 좋으니\n많은 관심과 참여 바랍니다."
            )
            .font(.pretend(type: .medium, size: 16))
            .lineHeight(1.25, fontSize: 16)

            VStack(alignment: .leading, spacing: 8) {
                Text("온라인 구매")
                    .font(.pretend(type: .medium, size: 14))
                    .foregroundStyle(.gray04)

                Label {
                    Link(url.limitTo(25), destination: URL(string: url)!)
                        .font(.pretend(type: .medium, size: 15))
                } icon: {
                    Image(systemName: "link")
                        .font(.pretend(type: .regular, size: 14))
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
                AppointmentInfoView(icon: "calendar", info: "4월 19일")
                AppointmentInfoView(icon: "clock", info: "오후 7시")
                AppointmentInfoView(icon: "location.circle", info: "지곡회관 앞")
            }
        }
    }

    private var participantListView: some View {
        VStack {
            HStack {
                Text("참여 인원(\(participantMemberNumber))")
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
                host: "삼겹살만취급함",
                members: ["쇼핑중독", "뚠뚠"],
                waitingMembers: ["파덕", "매일연어만먹음"]
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
                Text("댓글(\(commentNumber))")
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
