//
//  KeywordRegistrationView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/10/25.
//
// MARK: - 마이페이지 > 알림 > 키워드 알림 View
import SwiftUI

struct KeywordRegistrationView: View {
    @EnvironmentObject var router: MainNavigationRouter
    @State private var registeredKeywords: [String] = [
        "원두", "커피", "양배추", "허파", "냉동", "삼겹살"
    ]
    @State private var text: String = ""
    @FocusState var isFocused
    
    
    var body: some View {
        VStack {
            // 텍스트 필드 + 등록하기 버튼
            HStack(spacing: 12) {
                KeywordTextFieldView(
                    text: $text,
                    placeholder: "알림 받을 키워드를 입력해주세요"
                )
                .focused($isFocused)
                .disableAutocorrection(true)
                
                
                Button(action: {
                    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty else { return }
                    // 중복 방지: 이미 있으면 추가하지 않음
                    if !registeredKeywords.contains(trimmed) {
                        registeredKeywords.insert(trimmed, at: 0)
                    }
                    text = ""
                    isFocused = false
                }) {
                    Text("등록")
                        .font(.pretendardSemibold18)
                        .foregroundColor(!text.isEmpty ? .secondary : .gray40)
                        .padding(.all, 12)
//                        .padding(.vertical, 7)
//                        .padding(.horizontal, 13)
                        .background(!text.isEmpty ? Color.primaryColor : Color.gray10)
                        .cornerRadius(8)
                }
                
            }
            .padding()
            
            // 등록된 키워드
            if !registeredKeywords.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(registeredKeywords, id: \.self) { keyword in
                        HStack {
                            Text(keyword)
                                .font(.pretendardMedium18)
                                .foregroundColor(.black)
                                .padding(.vertical, 10)
                            Spacer()
                            Button(action: {
                                // 해당 키워드 삭제
                                if let idx = registeredKeywords.firstIndex(of: keyword) {
                                    registeredKeywords.remove(at: idx)
                                }
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.gray)
                                    .frame(width: 26, height: 26)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .navigationTitle("키워드 등록")
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
}


struct KeywordTextFieldView: View {
    @Binding var text: String
    let placeholder: String
    @FocusState var isFocused
    
    var body: some View {
        HStack(spacing: 12) {
            TextField(
                "SearchTextField",
                text: $text,
                prompt: Text(placeholder)
                    .font(.pretendardMedium16)
                    .foregroundColor(.gray50)
            )
            .font(.pretendardSemibold18)
            .foregroundColor(.black)
            .autocorrectionDisabled()
            .focused($isFocused)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.gray10)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray10, lineWidth: 1)
        )
        .cornerRadius(8)
    }
}



#Preview {
    NavigationStack {
        KeywordRegistrationView()
    }
}
