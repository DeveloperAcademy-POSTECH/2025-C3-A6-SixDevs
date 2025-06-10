//
//  DescriptionView+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct DescriptionView: View {
        @Binding var description: String
        var isEditMode: Bool = false
        @FocusState private var isTextEditorFocused: Bool

        var body: some View {
            VStack(spacing: 12) {
                HStack {
                    Text("설명 (선택)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .font(.pretendardMedium16)

                    // 편집 모드 표시
                    if isEditMode && !description.isEmpty {
                        Text("편집 중")
                            .font(.pretend(type: .light, size: 12))
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(4)
                    }
                }
                .padding(.horizontal, 16)

                Text("이런 내용을 적어보세요\n-가이드라인 1\n-가이드라인2\n-가이드라인3")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .padding(.trailing, 152)
                    .frame(width: 361)
                    .background(Color.gray10)
                    .foregroundColor(Color.gray70)
                    .font(.pretendardMedium16)

                // 멀티라인 텍스트 입력
                ZStack() {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            isTextEditorFocused
                                ? Color.blue
                                : Color.gray50,
                            lineWidth: isTextEditorFocused ? 2 : 1
                        )
                        .frame(width: 361, height: 244)
                        .background(Color.white)

                    if description.isEmpty {
                        VStack {
                            HStack {
                                Text("파티를 어떻게 운영할 것인지에 대한 구체적인 정보를 적어주세요.")
                                    .foregroundColor(.gray50)
                                    .font(.pretendardMedium16)
                                    .padding(.leading, 12)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .allowsHitTesting(false)
                    }

                    ScrollView {
                        VStack(spacing: 0) {
                            TextEditor(text: $description)
                                .font(.pretendardMedium16)
                                .foregroundColor(.black)
                                .focused($isTextEditorFocused)
                                .background(Color.clear)
                                .scrollContentBackground(.hidden)
                                .frame(minHeight: 228)
                                .textSelection(.enabled)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(width: 361, height: 244)
                }
                .cornerRadius(8)
                .animation(
                    .easeInOut(duration: 0.2),
                    value: isTextEditorFocused
                )

                // TODO: 멀티라인 입력 처리하기
                //                TextFieldView(
                //                    text: $description,
                //                    placeholder: "파티를 어떻게 운영할 것인지에 대한 구체적인 정보를 적어주세요."
                //                ).frame(width: 361, height: 244)
            }
        }
    }
}

#Preview {
    PartyCreateView()
}
