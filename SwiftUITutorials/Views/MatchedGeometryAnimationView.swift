//
//  MatchedGeometryAnimationView.swift
//  SwiftUITutorials
//
//  Created by shashank on 17/02/21.
//

import SwiftUI

struct MatchedGeometryAnimationView: View {
    @Namespace private var animation
    @State var changed: Bool = false
    var body: some View {
        ZStack {
            if changed {
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "shape1", in: animation)
                        .frame(width: 100, height: 100)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: "shape2", in: animation)
                    
                    Circle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "shape3", in: animation)
                        .frame(width: 100, height: 100)
                }
               
            } else {
                VStack {
                    Circle()
                        .fill(Color.red)
                        .matchedGeometryEffect(id: "shape2", in: animation)
                        .frame(width: 100, height: 100)
                       
                    Circle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "shape3", in: animation)
                        .frame(width: 100, height: 100)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: "shape1", in: animation)
                   
                }
                
            }
        }
        .onTapGesture {
            withAnimation {
                self.changed.toggle()
            }
        }
        .onAppear() {
          
        }
    }
}

struct MatchedGeometryAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryAnimationView()
    }
}
