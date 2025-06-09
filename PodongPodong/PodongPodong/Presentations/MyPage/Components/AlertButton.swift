//
//  AlertButton.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/9/25.
//

import SwiftUI

enum ActionType {
    case question
    case check
}

struct AlertButton: View {
    let title: String
    
    let actionType: ActionType
    
    let cancel: () -> ()
    let action: () -> ()
    
    var body: some View {
        ZStack {
            Color.gray70.opacity(0.5).ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 178)
                .overlay {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.pretendardBold20)
                            .foregroundStyle(Color.black)
                            .padding(.leading, 24)
                            .padding(.top, 40)
                        
                        
                        Spacer()
                        
                        
                        if actionType == .question {
                            CancelActionButtonView(cancelTitle: "취소", actionTitle: "로그아웃") {
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
    AlertButton(title: "로그아웃 하시겠어요?", actionType: .question) {
        
    } action: {
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AlertButton(title: "로그아웃되었습니다.", actionType: .check) {
        
    } action: {
        
    }
}
