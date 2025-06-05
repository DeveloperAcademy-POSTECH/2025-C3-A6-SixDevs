//
//  PartyList+NavigationView.swift
//  PodongPodong
//
//  Created by 김민석 on 6/5/25.
//

import SwiftUI

extension PartyListView {
    
    // MARK: NavigationBar View Items
    
    struct PartyListNavBarTitle: View {
        var body: some View {
            Text("포동포동")
                .font(.pretendardSemibold24)
                .foregroundColor(.primaryColor)
        }
    }
    
    struct PartyListNavBarButtons: View {
        let searchButtonAction: () -> Void
        let bellButtonAction: () -> Void
        
        var body: some View {
            HStack(spacing: 16) {
                Button(action: searchButtonAction) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
                Button(action: bellButtonAction) {
                    Image(systemName: "bell")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
            }
        }
    }
}
