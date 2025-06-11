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
    
    @State private var isNotificationEnabled = false
    @State private var isChatEnabled = false
    @State private var isPartyRequestEnabled = false
    @State private var isPartyStatusEnabled = false
    @State private var isInterestPartyEnabled = false
    @State private var isKeywordEnabled = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 알림 허용 전체 토글
            HStack {
                Text("알림 허용")
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Toggle("", isOn: $isNotificationEnabled)
                    .labelsHidden()
                    .tint(.primaryColor)
                    .onChange(of: isNotificationEnabled) {
                        if !isNotificationEnabled {
                            // 알림 허용이 꺼지면 모든 개별 알림도 꺼짐
                            isChatEnabled = false
                            isPartyRequestEnabled = false
                            isPartyStatusEnabled = false
                            isInterestPartyEnabled = false
                            isKeywordEnabled = false
                        }
                    }
            }
            .padding()
            
            // 개별 알림 토글 목록
            Group {
                SettingToggleRow(
                    title: "채팅 알림",
                    description: "채팅 메시지가 왔을 때 알림 수신",
                    isOn: $isChatEnabled,
                    enabled: isNotificationEnabled
                )
                SettingToggleRow(
                    title: "파티 참여 신청 알림",
                    description: "파티 참여 신청에 대한 알림 수신",
                    isOn: $isPartyRequestEnabled,
                    enabled: isNotificationEnabled
                )
                SettingToggleRow(
                    title: "참여 파티 알림",
                    description: "참여한 파티의 정보나 상태에 변동에 대한 알림 수신",
                    isOn: $isPartyStatusEnabled,
                    enabled: isNotificationEnabled
                )
                SettingToggleRow(
                    title: "관심 파티 알림",
                    description: "관심 파티의 정보에 변동에 대한 알림 수신",
                    isOn: $isInterestPartyEnabled,
                    enabled: isNotificationEnabled
                )
                SettingToggleRow(
                    title: "키워드 알림",
                    description: "등록한 키워드가 포함된 파티 생성 시 알림 수신",
                    isOn: $isKeywordEnabled,
                    enabled: isNotificationEnabled
                )
            }
            .padding(.horizontal)
            Spacer()
        }
        .background(Color(.systemBackground))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .navigationTitle("알림 설정")
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

struct SettingToggleRow: View {
    let title: String
    let description: String
    @Binding var isOn: Bool
    var enabled: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(title)
                    .font(.pretendardMedium16)
                    .foregroundColor(enabled ? .black : .gray60)
                Spacer()
                Toggle("", isOn: $isOn)
                    .labelsHidden()
                    .disabled(!enabled)
                    .tint(.primaryColor)
            }
            Text(description)
                .font(.pretendardMedium15)
                .foregroundColor(enabled ? .gray70 : .gray50)
        }
        .padding(.vertical, 10)
        .opacity(enabled ? 1.0 : 0.5)
    }
}


#Preview {
    NavigationStack {
        AlarmSettingView()
    }
}


