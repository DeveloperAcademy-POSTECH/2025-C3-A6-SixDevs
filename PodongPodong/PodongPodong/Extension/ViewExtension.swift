//
//  ViewExtension.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/8/25.
//

import SwiftUI

extension View {
    func hideBackButton() -> some View {
        self.navigationBarBackButtonHidden(true)
    }
    
    func hideKeyboard() {
           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
       }
}
