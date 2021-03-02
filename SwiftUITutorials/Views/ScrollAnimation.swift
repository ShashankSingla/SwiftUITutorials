//
//  ScrollAnimation.swift
//  SwiftUITutorials
//
//  Created by shashank on 25/02/21.
//

import SwiftUI

struct ScrollAnimation: View {
    @State var currentPage: Int = 0
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        ScrollView(.init()) {
            TabView {
                GeometryReader { proxy in
                    let screen = proxy.frame(in: .global)
                    let offset = screen.minX
                    let scale = 1 + (offset / screen.width)
                    TabView(selection: $currentPage) {
                        VerticalScrollView(screen: screen)
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .rotationEffect(.degrees(90))
                    .frame(width: screen.width)
                    .scaleEffect(scale >= 0.88 ? scale: 0.88, anchor: .center)
                    .offset(x: -offset)
                    .blur(radius: (1 - scale) * 20)
                    .tag(currentPage)
                }
                DetailView(selectedIndex: currentPage)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("List")
        //.ignoresSafeArea()
        
    }
}

struct ScrollAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ScrollAnimation()
    }
}

var edge = UIApplication.shared.windows.first?.safeAreaInsets
