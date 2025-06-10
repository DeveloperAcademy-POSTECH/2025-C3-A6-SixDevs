//
//  AlarmSettingView.swift
//  PodongPodong
//
//  Created by 김서현 on 6/10/25.
//

// MARK: - 마이페이지 > 알림 > 알림 설정 View
import SwiftUI

struct AlarmSettingView: View {
    
    @EnvironmentObject var router: MainNavigationRouter
    
    var body: some View {
        ZStack {
            Image("AlarmSettingViewImage")
                .resizable()
                .scaledToFit()
                .navigationTitle("알림 설정")
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
}

#Preview {
    NavigationStack {
        AlarmSettingView()
    }
}
