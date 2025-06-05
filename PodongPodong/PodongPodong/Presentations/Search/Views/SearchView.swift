//
//  SearchView.swift
//  PodongPodong
//
//  Created by Paidion on 6/4/25.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) private var dismiss
    
    
    @State var searchText: String = ""
    
    
    var body: some View {
        
        VStack {
            // 1. 상단 검색바 (내비게이션, 검색 텍스트필드)
            SearchHeaderView(text: searchText)
            
            // 2. 공동 구매 / 장보기 (탭버튼)
            
            
            // 3. 검색 목록 (모집중-진행중만 보기 / 필터 버튼)
            
            
            // 4. 필터 바텀 시트
            
            Spacer()
        }
        .border(Color.black)
        
    }
}

struct SearchHeaderView: View {
    @State var text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Button {
                //                dismiss()
                print("이전 화면으로 이동하기")
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
            SearchTextFieldView(
                text: $text,
                placeholder: "검색어를 입력해주세요"
            )
        }
        .padding(.horizontal)
    }
}



#Preview {
    NavigationStack {
        SearchView()
    }
}
