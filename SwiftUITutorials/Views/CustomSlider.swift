//
//  CustomSlider.swift
//  SwiftUITutorials
//
//  Created by shashank on 18/02/21.
//

import SwiftUI

struct CustomSlider: View {
    let maxHeight: CGFloat = 300
    @State var filledHeight: CGFloat = 0
    @State var dragValue: CGFloat = 0
    @State var progress: Int = 0
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(Color("glassColor"))
                Rectangle()
                    .fill(Color("fillColor"))
                    .frame(height: filledHeight)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 2)
                    
            }
            .frame(width: 120, height: maxHeight)
            .background(Color("glassColor"))
            .gesture(
                DragGesture(minimumDistance: 1).onChanged({ (value) in
                    DispatchQueue.main.async {
                        self.filledHeight = -value.translation.height +  self.dragValue
                        if filledHeight < 0 {
                            filledHeight = 0
                        }
                        if filledHeight > self.maxHeight {
                            filledHeight = self.maxHeight
                        }
                        self.progress = Int(filledHeight * 100 / maxHeight)
                    }
                }).onEnded({ (value) in
                    DispatchQueue.main.async {
                        self.dragValue = -value.translation.height
                        if self.dragValue < 0 {
                            self.dragValue = 0
                        }
                        if dragValue > self.maxHeight {
                            dragValue = self.maxHeight
                        }
                    }
                })
            )
            .clipped()
            .cornerRadius(10)
            .overlay(
                Text("\(progress)%")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .offset(y: -filledHeight < -maxHeight + 40 ? -maxHeight + 40 :-self.filledHeight)
                    .padding(.bottom, 10)
                , alignment: .bottom
            )
           
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bg").edgesIgnoringSafeArea(.bottom))
        .navigationTitle("Home")
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomSlider()
        }
    }
}
