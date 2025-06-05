//
//  ChatView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/4/25.
//

import SwiftUI
import SendbirdSwiftUI

struct ChatView: View {
    @ObservedObject var provider: GroupChannelViewProvider
    
    var body: some View {
        GroupChannelView(
            provider: provider,
            headerItem: {
                .init()
                .leftView { viewConfig in
                    Image(systemName: "chevron.left")
                        .frame(width: 36, height: 36)
                }
                .titleView(content: { viewConfig in
                    Text(provider.channel?.name ?? "")
                        .font(.pretendardBold18)
                        .foregroundStyle(Color.black)
                })
                .rightView { viewConfig in // Use chaining.
                    Image(systemName: "line.3.horizontal")
                        .frame(width: 36, height: 36)
                        .onTapGesture {
                            // TODO: 서랍장 만들기
                        }
                }
            },
            listItem: {
                .init()
                .rowView { config in
                    let isMyMessage = config.message.sender?.userId == "rlawlsgur716"
                    let profileImageURL = config.message.sender?.profileURL
                    
                    HStack(alignment: .bottom, spacing: 6) {
                        if isMyMessage {
                            Spacer()
                            HStack(alignment: .bottom, spacing: 4) {
                                Button {
                                    // TODO: 채팅 이벤트 만들기
                                } label: {
                                    Text(config.message.createdAt.toChatTimeString())
                                        .font(.pretendardMedium12)
                                        .foregroundColor(Color.gray60)
                                    
                                    Text(config.message.message)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 16)
                                        .font(.pretendardMedium16)
                                        .background(Color.primaryColor)
                                        .foregroundColor(Color.black)
                                        .cornerRadius(18)
                                }
                            }
                        } else {
                            HStack(alignment: .top) {
                                
                                Button {
                                    // Action
                                    
                                } label: {
                                    if let urlString = profileImageURL,
                                       let url = URL(string: urlString) {
                                        AsyncImage(url: url) { phase in
                                            if let image = phase.image {
                                                image.resizable()
                                            } else {
                                                Circle().fill(Color.gray.opacity(0.4))
                                            }
                                        }
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                    } else {
                                        Circle()
                                            .fill(Color.primaryColor)
                                            .frame(width: 30, height: 30)
                                    }
                                    
                                    
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(config.message.sender?.nickname ?? "x")
                                            .font(.pretendardSemibold14)
                                            .foregroundStyle(Color.gray80)
                                        
                                        HStack(alignment: .bottom, spacing: 4) {
                                            Text(config.message.message)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 16)
                                                .font(.pretendardMedium16)
                                                .background(Color.gray10)
                                                .foregroundColor(.black)
                                                .cornerRadius(18)
                                            Text(config.message.createdAt.toChatTimeString())
                                                .font(.pretendardMedium12)
                                                .foregroundColor(Color.gray60)
                                        }
                                    }
                                }
                                
                                
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                }
            },
            inputItem: {
                .init()
                .addButton { _ in
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.primaryColor)
                        .overlay {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.white)
                        }
                }
                .sendButton { _ in
                    Circle()
                        .foregroundStyle(Color.primaryColor)
                        .frame(width: 34, height: 34)
                        .overlay(
                            Image(systemName: "arrow.up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.white)
                        )
                        .padding(.bottom, 4)
                }
            }
        )
    }
}

#Preview {
    ChatView(
        provider: GroupChannelViewProvider(
            channelURL: Bundle.main.testChannel
        )
    )
}
