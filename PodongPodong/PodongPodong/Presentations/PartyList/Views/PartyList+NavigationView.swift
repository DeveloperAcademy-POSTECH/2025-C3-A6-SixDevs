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
            StrokeText(
                text: "포동포동",
                width: 0.6,
                fontColor: Color.primaryColor,
                strokeColor: Color(hex: "FFB403")
            ).font(.npsfontBold26)
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
                        .foregroundColor(.secondary)
                }
                Button(action: bellButtonAction) {
                    Image(systemName: "bell")
                        .font(.system(size: 24))
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let fontColor: Color
    let strokeColor: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(strokeColor)
            Text(text)
                .foregroundColor(fontColor)
        }
    }
}
