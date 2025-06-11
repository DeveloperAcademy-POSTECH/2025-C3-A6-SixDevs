//
//  UpdateProfileView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/11/25.
//

import SwiftUI

struct UpdateProfileView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.white
            
            VStack {
                profileTheme
                
            }
            .padding(.horizontal, 22)
            
        }
    }
    
    // MARK: - 프로필 테마 선택
    private var profileTheme: some View {
        Text("프로필 테마 선택")
            .font(.pretendardBold20)
            .foregroundStyle(Color.black)
        
        
    }
}

#Preview {
    UpdateProfileView()
}
