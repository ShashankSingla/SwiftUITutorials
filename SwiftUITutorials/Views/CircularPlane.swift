//
//  CircularPlane.swift
//  ButttonDesigns
//
//  Created by shashank on 16/02/21.
//

import SwiftUI

struct CircularPlane: View {
    @State var rotate: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.yellow)
                .frame(width: 200)
            Image(systemName: "airplane")
                .rotationEffect(.degrees(90))
                .offset(x: 100)
                .rotationEffect(rotate ? .degrees(0): .degrees(-360))
                .animation(
                    Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)
                )
            
            Image(systemName: "airplane")
                .rotationEffect(.degrees(90))
                .offset(x: 100)
                .rotationEffect(rotate ? .degrees(-90): .degrees(-450))
                .animation(
                    Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)
                )
            
        }
        .padding()
        .onAppear() {
            self.rotate = true
        }
    }
}

struct CircularPlane_Previews: PreviewProvider {
    static var previews: some View {
        CircularPlane()
    }
}
