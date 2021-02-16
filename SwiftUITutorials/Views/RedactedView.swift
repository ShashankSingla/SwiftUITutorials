//
//  RedactedView.swift
//  ButttonDesigns
//
//  Created by shashank on 16/02/21.
//

import SwiftUI

struct RedactedView: View {
    @State var dataLoaded: Bool = false
    var body: some View {
        List {
            ForEach(0..<10) { index in
                HStack(spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .mask(Circle())
                    VStack(alignment: .leading, spacing: 6) {
                        Text("What is Lorem Ipsum?")
                            .font(.callout)
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                            .font(.callout)
                    }
                }
                .padding(.vertical)
            }
            .redacted(reason: dataLoaded ? []: .placeholder)
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation { 
                    self.dataLoaded = true
                }
               
            }
        }
       
    }
}

struct RedactedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RedactedView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
