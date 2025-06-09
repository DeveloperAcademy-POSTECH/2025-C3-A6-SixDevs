//
//  SearchList+FilterHeader.swift
//  PodongPodong
//
//  Created by Paidion on 6/5/25.
//

import SwiftUI


extension SearchView {
    struct SearchList_FilterHeader: View {
        @Binding var isShowingNotCompletedPartyOnly: Bool
        var isFilterApplied: Bool
        
        let checkButtonAction: () -> Void
        let filterButtonAction: () -> Void
        
        var body: some View {
            HStack {
                HStack(spacing: 8) {
                    Button(action: checkButtonAction) {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 18))
                        
                        Text("모집중 - 진행중만 보기")
                            .font(isShowingNotCompletedPartyOnly
                                  ? .pretendardBold14
                                  : .pretendardMedium14)
                    }
                    .foregroundColor(
                        isShowingNotCompletedPartyOnly
                        ? .primaryColor
                        : .gray30
                    )
                }
                Spacer()
                Button(action: filterButtonAction) {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 18))
                }
                .foregroundColor(
                    isFilterApplied
                    ? .primaryColor
                    : .gray30
                )
            }
            .padding()
        }
    }
}
