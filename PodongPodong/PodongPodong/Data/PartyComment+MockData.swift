//
//  PartyComment+MockData.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/4/25.
//

import Foundation

extension PartyComment {
    // MARK: - Sample Comments
    static let sampleComments: [PartyComment] = [
        PartyComment(
            user: User.sampleUsers[0],
            content: "냉장 삼겹살이 정말 맛있어요! 많은 참여 부탁드립니다 🥩"
        ),
        PartyComment(
            user: User.sampleUsers[1],
            content: "가격이 정말 좋네요! 참여하고 싶습니다"
        ),
        PartyComment(
            user: User.sampleUsers[5],
            content: "쿠팡에서 주문하는 거죠? 배송은 언제쯤 될까요?"
        ),
        PartyComment(
            user: User.sampleUsers[0],
            content: "내일 오후에 배송 예정이에요! 픽업 시간은 따로 공지드릴게요 😊"
        ),
        PartyComment(
            user: User.sampleUsers[3],
            content: "호스트에게만 보이는 비공개 댓글입니다"
        ),
        PartyComment(
            user: User.sampleUsers[6],
            content: "건강한 식재료로 보이네요! 영양성분은 어떤가요?"
        )
    ]
    
    // MARK: - Comment Templates
    private static let commentTemplates = [
        "좋은 기회네요! 참여하고 싶습니다",
        "가격이 정말 합리적이에요",
        "언제까지 모집하시나요?",
        "품질은 어떤가요?",
        "배송은 언제쯤 될까요?",
        "참여 신청했습니다!",
        "다음에도 이런 기회가 있으면 좋겠어요",
        "공동구매 처음인데 어떻게 진행되나요?",
        "신선도는 괜찮을까요?",
        "픽업 장소가 어디인지 알 수 있을까요?",
        "결제는 어떻게 하나요?",
        "취소는 언제까지 가능한가요?",
        "리뷰 평점이 좋으시네요! 믿고 참여합니다",
        "이전에도 이런 공구 하셨나요?",
        "포장은 어떻게 되나요?"
    ]
    
    private static let hostCommentTemplates = [
        "많은 관심과 참여 부탁드립니다!",
        "질문 있으시면 언제든 댓글로 남겨주세요",
        "픽업 시간은 따로 공지드릴게요",
        "신선한 상품으로 준비하겠습니다",
        "배송 일정 확정되면 바로 알려드릴게요",
        "참여해주셔서 감사합니다!",
        "품질에 자신있으니 안심하고 참여하세요",
        "결제 관련 문의는 개별 연락 부탁드려요"
    ]
}
