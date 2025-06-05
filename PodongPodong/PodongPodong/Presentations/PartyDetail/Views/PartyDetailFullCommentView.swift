//
//  PartyDetailFullCommentView.swift
//  PodongPodong
//
//  Created by PenguinLand on 6/5/25.
//

import SwiftUI

struct PartyDetailFullCommentView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var commentText: String = ""
    
    let party: Party
    let currentUser: User
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                headerSection
                contentSection
                Spacer()
                bottomSection
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                navigationToolbarItems
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
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
        Text("댓글 목록(\(party.comments.count))")
            .font(.pretend(type: .bold, size: 18))
    }
    
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(alignment: .leading) {
            Text(party.title)
                .font(.pretend(type: .semibold, size: 20))
            Divider()
        }
    }
    
    // MARK: - Content Section
    private var contentSection: some View {
        Group {
            if party.comments.isEmpty {
                VStack {
                    Spacer()
                    
                    VStack(spacing: 16) {
                        Text("등록된 댓글이 없습니다.")
                            .font(.pretend(type: .medium, size: 16))
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    CommentView(comments: party.comments)
                }
            }
        }
    }
    
    // MARK: - Bottom Section
    private var bottomSection: some View {
        VStack(spacing: 15) {
            Divider()
            HStack {
                CommentFieldView(
                    text: $commentText,
                    placeholder: "댓글을 작성해주세요"
                )
                .frame(width: 295, height: 40)
                
                SubmitCommentButton(title: "등록", isEnabled: !commentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    .frame(width: 54, height: 40)
            }
        }
    }
}

struct CommentFieldView: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        HStack(spacing: 12) {
            TextField(
                "TextFiled",
                text: $text,
                prompt: Text(placeholder)
                    .font(.pretendardMedium16)
                    .foregroundColor(.gray50)
            )
            .font(.pretendardSemibold18)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray10)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray10, lineWidth: 1)
        )
        .cornerRadius(8)
    }
}

private struct SubmitCommentButton: View {
    let title: String
    let isEnabled: Bool

    var body: some View {
        Text(title)
            .font(.pretend(type: .semibold, size: 18))
            .foregroundColor(isEnabled ? .black : Color.gray40)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(isEnabled ? Color.primaryColor : Color.gray10)
            .cornerRadius(12)
    }
}

#Preview {
    NavigationStack {
        PartyDetailFullCommentView(
            party: Party.sampleData,
            currentUser: User.sampleCurrentUser
        )
    }
}
