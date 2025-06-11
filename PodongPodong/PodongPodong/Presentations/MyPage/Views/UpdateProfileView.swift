//
//  UpdateProfileView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/11/25.
//

import SwiftUI

struct UpdateProfileView: View {
    
    @Environment(\.myPageVM) private var viewModel
    @EnvironmentObject var router: MainNavigationRouter
    
    // FIXME: - 임시
    @State private var nickNameText = ""
    @State private var emailText =  ""
    @State private var emptyText =  ""
    @State private var profileImage = ""
    
    private let rows = Array(repeating: GridItem(.flexible(minimum: 72, maximum: 72), spacing: 32), count: 3)
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                
                profileTheme
                
                
                Spacer().frame(height: 38)
                
                
                inputNicknameView
                
                
                Spacer().frame(height: 38)
                
                
                inputEmailView
                
                
                Spacer()
                
                
                updateButtonView
                
                
                Spacer()
                
            }
            .padding(.horizontal, 22)
            .navigationTitle("프로필 수정")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            guard let userInfo = viewModel.userInfo else { return }
            self.nickNameText = userInfo.nickName
            self.emailText = userInfo.email
            self.profileImage = userInfo.profileImage
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    router.pop()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                        .frame(width: 36, height: 36)
                }
            }
        }
    }
    
    // MARK: - 닉네임 변경
    private var inputNicknameView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("닉네임")
                .font(.pretendardMedium14)
                .foregroundStyle(Color.gray60)
            
            TextFieldView(text: $nickNameText, placeholder: "닉네임을 입력해주세요")
                .frame(height: 48)
        }
    }
    
    // MARK: - 이메일 입력창 (비활성화)
    private var inputEmailView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("이메일")
                .font(.pretendardMedium14)
                .foregroundStyle(Color.gray60)
            
            TextFieldView(text: $emptyText, placeholder: self.emailText)
                .frame(height: 48)
                .disabled(true)
        }
    }
    
    
    // MARK: - 프로필 테마 선택
    private var profileTheme: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("프로필 아이콘")
                .font(.pretendardMedium14)
                .foregroundStyle(Color.gray60)
            
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(viewModel.myPageProfile, id: \.self) { profile in
                    Image(profile.profileImage)
                        .resizable()
                        .scaledToFit()
                        .opacity(profile.profileImage == self.profileImage ? 1.0 : 0.4)
                        .onTapGesture {
                            self.profileImage = profile.profileImage
                        }
                }
            }
        }
    }
    
    
    // MARK: - 수정 완료 버튼
    private var updateButtonView: some View {
    
        Button {
            guard let userInfo = viewModel.userInfo else {
                print("유저 정보 없음")
                return
            }
            
            let updatedUser = User(
                email: userInfo.email,
                nickName: self.nickNameText,
                profileImage: self.profileImage,
                reviewRating: userInfo.reviewRating
            )

            viewModel.updateUserInfo(userInfo: updatedUser)
            viewModel.loadUserInfo()
            router.pop()
        } label: {
            ActionButtonView(title: "수정 완료", isEnabled: !nickNameText.isEmpty)
        }
    }
}

#Preview {
    NavigationStack {
        UpdateProfileView()
    }
}
