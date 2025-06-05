//
//  PartyListView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/1/25.
//

import SwiftUI

struct PartyListView: View {
    @State private var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
            .navigationBarItems(
                leading: PartyListNavBarTitle(),
                trailing: PartyListNavBarButtons(
                    searchButtonAction: {},
                    bellButtonAction: {}
                )
    }
}

// MARK: - navigationBar View Items

extension PartyListView {
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

#Preview {
    PartyListView()
}
