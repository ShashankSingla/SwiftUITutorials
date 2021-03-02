//
//  DetailView.swift
//  ScrollAnimation
//
//  Created by shashank on 25/02/21.
//

import SwiftUI

struct DetailView: View {
    var selectedIndex: Int
    var body: some View {
        VStack(spacing: 20) {
            
            Image("image\(selectedIndex+1)")
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
            
            Divider()
                .background(Color.white)
            
            VStack {
                Text("Image\(selectedIndex + 1)")
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Image\(selectedIndex + 1) Info")
                    .foregroundColor(Color.secondary)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
                .background(Color.white)
            
            Button(action: {
                
            }, label: {
                Capsule()
                    .overlay(
                        Text("Download")
                            .foregroundColor(Color.white)
                    )
                
                
            })
            .frame(width: 200, height: 50)
               
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        
    }
}
