//
//  VerticalScrollView.swift
//  ScrollAnimation
//
//  Created by shashank on 25/02/21.
//

import SwiftUI

struct VerticalScrollView: View {
    var screen: CGRect
    var body: some View {
        ForEach(0..<5, id: \.self) { index in
            Image("image\(index + 1)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .frame(width: screen.width, height: screen.height)
                .rotationEffect(.degrees(-90))
                .frame(width: screen.height, height: screen.width)
              
        }
        .navigationTitle("List")
        
        
    }
}
