//
//  UpdateProfileView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/11/25.
//

import SwiftUI

struct UpdateProfileView: View {
    let viewModel: MyPageViewModel = .init()
    
    @EnvironmentObject var router: MainNavigationRouter
    
    // FIXME: - 임시
    @State private var nickNameText: String = ""
    @State private var emailText: String = ""
    

    private let rows = Array(repeating: GridItem(.flexible(minimum: 72, maximum: 72), spacing: 32), count: 3)
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.white
            
            VStack(alignment: .leading) {
                
                inputNicknameView
                
                Spacer().frame(height: 38)
                
                inputEmailView
                
                Spacer().frame(height: 38)
                
                profileTheme
                
                Spacer()
                
                ActionButtonView(title: "수정 완료", isEnabled: true)
            }
            .padding(.horizontal, 22)
            .navigationTitle("프로필 수정")
            .navigationBarTitleDisplayMode(.inline)
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
    var inputNicknameView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("닉네임")
                .font(.pretendardMedium14)
                .foregroundStyle(Color.gray60)
            
            TextFieldView(text: $nickNameText, placeholder: "닉네임을 입력해주세요")
                .frame(height: 48)
        }
    }
    
    // MARK: - 이메일 입력창 (비활성화)
    var inputEmailView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("이메일")
                .font(.pretendardMedium14)
                .foregroundStyle(Color.gray60)
            
            TextFieldView(text: $nickNameText, placeholder: "이메일을 입력해주세요")
                .frame(height: 48)
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
                    }
                }
            }
        }
    
    
}

#Preview {
    NavigationStack {
        UpdateProfileView()
    }
}
