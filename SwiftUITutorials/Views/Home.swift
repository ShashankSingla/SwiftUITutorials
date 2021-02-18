//
//  Home.swift
//  ButttonDesigns
//
//  Created by shashank on 16/02/21.
//

import SwiftUI

struct Home: View {
    @State var selected: Int?
    var list = ["Plane Animation", "Redacted Sample", "MatchedGeometry Animation", "CustomSlider"]
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: CircularPlane(), tag: 1, selection: $selected, label: {
                    EmptyView()
                })
                NavigationLink(destination: RedactedView(), tag: 2, selection: $selected, label: {
                    EmptyView()
                })
                NavigationLink(destination: MatchedGeometryAnimationView(), tag: 3, selection: $selected, label: {
                    EmptyView()
                })
                NavigationLink(destination: CustomSlider(), tag: 4, selection: $selected, label: {
                    EmptyView()
                })
                List {
                    ForEach (0..<list.count) { index in
                        HStack {
                            Text("\(index + 1). ").fontWeight(.bold) + Text(list[index])
                            Spacer()
                        }
                        .onTapGesture {
                            self.selected = index + 1
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tutorials")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
