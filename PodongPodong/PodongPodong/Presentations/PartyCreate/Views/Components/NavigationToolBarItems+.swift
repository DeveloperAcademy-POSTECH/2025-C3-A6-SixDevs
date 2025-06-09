//
//  NavigationToolBarItems+.swift
//  PodongPodong
//
//  Created by 김민석 on 6/9/25.
//

import SwiftUI

extension PartyCreateView {
    struct BackButton: View {
        let dismiss: DismissAction
        
        var body: some View {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
        }
    }
}
