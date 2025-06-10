//
//  MyReviewView.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/10/25.
//

import SwiftUI

struct MyReviewView: View {
    var body: some View {
        ZStack {
            Image("MyReviewImage")
                .resizable()
                .scaledToFit()
                .navigationTitle("내가 받은 후기")
                .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                
                Button {
//                    router.pop()
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
        MyReviewView()
    }
}
