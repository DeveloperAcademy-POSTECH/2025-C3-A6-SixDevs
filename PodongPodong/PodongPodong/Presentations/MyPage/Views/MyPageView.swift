//
//  MyPageView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/6/25.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            informationView
            reviewView
            myActivityView
            alertSettingView
            accountSettingView
            Spacer()
        }
        .padding(.horizontal, 28)
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
                Text("닉네임")
                    .foregroundStyle(.black)
                    .font(.pretendardBold20)

                Text("이메일")
                    .foregroundStyle(Color.gray60)
                    .font(.pretendardMedium14)
            }
            Spacer()
        }
    }
    
    // MARK: - Review View
    private var reviewView: some View {
        HStack {
            VStack(spacing: 8) {
                Text("별점 평균")
                    .font(.pretendardSemibold14)
                    .foregroundStyle(Color.gray60)

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(Color.primaryColor)
                    Text("4.8")
                        .font(.pretendardSemibold18)
                } //: HSTACK
            } //: VSTACK

            Spacer().frame(width: 60)

            Rectangle()
                .frame(width: 1, height: 48)
                .foregroundStyle(Color.gray50)

            Spacer().frame(width: 60)

            VStack(spacing: 8) {
                Text("내 후기")
                    .font(.pretendardSemibold14)
                    .foregroundStyle(Color.gray60)

                Text("222")
                    .font(.pretendardSemibold18)
            }
        }
        .padding(.horizontal, 24)
        .frame(width: 361, height: 80)
        .background(Color.gray00)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray00))
    }
    
    
    // MARK: - My Activity View
    private var myActivityView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("내 활동")
                .font(.pretendardMedium18)
                .foregroundStyle(Color.gray60)

            Button(action:{
                //후기로 이동
            }){
                Text("후기")
                    .font(.pretendardMedium18)
                    .foregroundStyle(.black)
            }
            Button(action:{
                //참파로 이동
            }){
                Text("참여한 파티")
                    .font(.pretendardMedium18)
                    .foregroundStyle(.black)
            }
            Button(action:{
                //관심 파티 목록으로 이동
            }){
                Text("관심 파티 목록")
                    .font(.pretendardMedium18)
                    .foregroundStyle(.black)
            }
        }//: VSTACK
    }

    // MARK: - Alert Setting View
    private var alertSettingView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("설정")
                .font(.pretendardMedium18)
                .foregroundStyle(Color.gray60)

            Button(action:{
                //알림으로 이동
            }){
                Text("알림")
                    .font(.pretendardMedium18)
                    .foregroundStyle(.black)
            }
            Button(action:{
                //키워드 등록 이동
            }){
                Text("키워드 등록")
                    .font(.pretendardMedium18)
                    .foregroundStyle(.black)
            }
        }
    }
    
    // MARK: - Account Setting View
    private var accountSettingView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("계정")
                .font(.pretendardMedium18)
                .foregroundStyle(Color.gray60)

            Button(action:{
                //로그아웃
            }){
                Text("로그아웃")
                    .font(.pretendardMedium18)
                    .foregroundStyle(.black)
            }
            Button(action:{
                //회원 탈퇴
            }){
                Text("회원 탈퇴")
                    .font(.pretendardMedium18)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    MyPageView()
}
