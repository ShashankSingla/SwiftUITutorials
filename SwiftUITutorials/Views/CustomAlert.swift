//
//  CustomAlert.swift
//  SwiftUITutorials
//
//  Created by shashank on 02/03/21.
//

import SwiftUI

struct CustomAlert: View {
    @State var showAlert: Bool = false
    var body: some View {
        ZStack {
            Image("image8")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width)
                
            if !self.showAlert {
                Button(action: {
                    self.showAlert = true
                }, label: {
                    Capsule()
                        .overlay(
                            Text("Show Alert")
                                .foregroundColor(.white)
                        )
                })
                .frame(width: 200, height: 50)
            }
        }
        .SSAlart(message: "Do you really want to end this workout?", cancelBtnTitle: "Cancel", otherBtnTitle: "Okay", show: $showAlert, cancelAction: {
            self.showAlert = false
        }, otherAction: {
            self.showAlert = false
        })
       
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert()
    }
}
