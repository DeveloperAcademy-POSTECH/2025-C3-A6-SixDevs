//
//  MyPageView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/6/25.
//  Updated by 김진혁 on 6/9/25.

import SwiftUI

struct MyPageView: View {
    @State private var viewModel: MyPageViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack() {
                informationView
                    .padding(.horizontal, 16)
                reviewView
                    .padding(.horizontal, 16)
                myActivityView
                
            }
            
            // FIXME: - 로직 수정
            if viewModel.alertType == .signOut && viewModel.alertType != nil {
                
                SignOutView(title: "로그아웃 하시겠어요?", actionType: .question) {
                    viewModel.alertType = nil
                } action: {
                    viewModel.currentUserSignOut()
                    viewModel.alertType = nil
                }
            }
            
            if viewModel.alertType == .withdrawal && viewModel.alertType != nil {
                WithdrawalView(title: "정말 탈퇴하시겠어요?", content: "탈퇴 시, 계정에 저장된 정보는 모두 삭제되며 복구되지 않습니다.", actionType: .question) {
                    viewModel.alertType = nil
                } action: {
                    viewModel.currentUserWithdrawal()
                    viewModel.alertType = nil
                }
            }
            
            if viewModel.isComplete {
                SignOutView(title: "로그아웃되었습니다.", actionType: .check) {
                } action: {
                    viewModel.isComplete = false
                }
            }
            
            
            if viewModel.isCompleteWithdrawal {
                WithdrawalView(title: "탈퇴되었습니다.", content: nil, actionType: .check) {
                } action: {
                    viewModel.isCompleteWithdrawal = false
                }
                
            }
            
        }
    }
    
    // MARK: - Information View
    private var informationView: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.2")
            // TODO: 나중에 프로필 사진으로 바꿔야 함!!!
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack(spacing: 16) {
                    
                    Text(viewModel.userInfo?.nickName ?? "")
                        .foregroundStyle(.black)
                        .font(.pretendardBold20)
                    
                    
                    Button {
                        // TODO: 프로필 수정 로직
                    } label: {
                        Text("프로필 수정")
                            .font(.pretendardMedium12)
                            .foregroundStyle(Color.gray60)
                        
                        Image(systemName: "chevron.right")
                            .font(.pretendardMedium8)
                            .foregroundStyle(Color.gray60)
                            .offset(x: -5)
                    }
                }
                
                Text(viewModel.userInfo?.email ?? "이메일")
                    .foregroundStyle(Color.gray60)
                    .font(.pretendardMedium14)
            }
            Spacer()
        }
    }
    
    // MARK: - Review View
    private var reviewView: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.gray00)
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .overlay {
                HStack {
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Text("별점 평균")
                            .font(.pretendardSemibold14)
                            .foregroundStyle(Color.gray60)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundStyle(Color.primaryColor)
                            Text(String(viewModel.userInfo?.reviewRating ?? 0.0))
                                .font(.pretendardSemibold18)
                                .foregroundStyle(Color.secondary)
                        }
                    }
                    
                    
                    Spacer()
                    
                    
                    Rectangle()
                        .frame(width: 1, height: 48)
                        .foregroundStyle(Color.gray50)
                    
                    
                    Spacer()
                    
                    
                    VStack(spacing: 2) {
                        
                        Text("내 후기")
                            .font(.pretendardSemibold14)
                            .foregroundStyle(Color.gray60)
                        
                        Text("0")
                            .font(.pretendardSemibold18)
                            .foregroundStyle(Color.secondary)
                    }
                    
                    Spacer()
                }
            }
    }
    
    // MARK: - My Activity View
    private var myActivityView: some View {
        List {
            ForEach(viewModel.sections, id: \.self) { section in
                Text(section.rawValue)
                    .font(.pretendardMedium16)
                    .foregroundStyle(Color.gray60)
                    .padding(EdgeInsets(top: 16, leading: 4, bottom: 0, trailing: 0))
                
                ForEach(section.items, id: \.self) { item in
                    MyPageListItem(title: item.title) {
                        viewModel.handleAction(item: item)
                    }
                    .padding(EdgeInsets(top: 12, leading: 4, bottom: 12, trailing: 0))
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
    }
    
}

#Preview {
    MyPageView()
}
