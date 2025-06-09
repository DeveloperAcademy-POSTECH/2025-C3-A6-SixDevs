//
//  WithdrawalView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/9/25.
//

import SwiftUI


struct WithdrawalView: View {
    let title: String
    
    let content: String?
    
    let actionType: ActionType
    
    let cancel: () -> ()
    let action: () -> ()
    
    var body: some View {
        ZStack {
            Color.gray70.opacity(0.5).ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: content != nil ? 240 : 178)
                .overlay {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.pretendardBold20)
                            .foregroundStyle(Color.black)
                            .padding(.leading, 24)
                            .padding(.top, 40)
                        
                        if content != nil {
                            Spacer().frame(height: 12)
                            Text(content ?? "")
                                .font(.pretendardMedium16)
                                .foregroundStyle(Color.black)
                                .padding(.leading, 24)
                        }
                        
                        
                        Spacer().frame(height: 32)
                        
                        
                        if actionType == .question {
                            CancelActionButtonView(cancelTitle: "취소", actionTitle: "탈퇴") {
                                cancel()
                            } onAction: {
                                action()
                            }
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
                        }
                        else if actionType == .check {
                            Button {
                                action()
                            } label: {
                                ActionButtonView(title: "확인", isEnabled: true)
                            }
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
                        }
                        
                    }
                }
                .padding(.horizontal, 16)
        }
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    WithdrawalView(title: "정말 탈퇴하시겠어요?", content: "탈퇴 시, 계정에 저장된 정보는 모두 삭제되며 복구되지 않습니다.", actionType: .question) {
        
    } action: {
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    WithdrawalView(title: "탈퇴되었습니다.", content: nil, actionType: .check) {
        
    } action: {
        
    }
}
