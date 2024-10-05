//
//  ShapeView.swift
//  NewTestProject
//
//  Created by Gdwn on 04/10/2024.
//

import SwiftUI

struct ShapeView: View {
    var body: some View {
        VStack {
            Capsule(style: .circular)
                .fill(Color("AccentColor")) // seems like this modifier must come first else it will throw an error.
                .frame(width: 100, height: 50)
            
            // this has more corner smoothing than the circular version
            Capsule(style: .continuous)
                .frame(width: 100, height: 50)
            
            // circle won't get squished even if you set a different height
            Circle()
                .frame(width: 100, height: 100) // is there a need to enter the height?
            
            // use Ellipse if you want it to get squished
            Ellipse()
                .fill(Color("Secondary"))
                .frame(width: 100, height: 50)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .cornerRadius(0) // there is a rounded rectangle option though
            
            RoundedRectangle(cornerRadius: 16) //
                .fill(Color("Secondary")) // always apply this first
                .stroke(Color("AccentColor"), lineWidth : 8) // must add this first except there is a fill
                // more about stroke and borders in BorderView file
                .frame(width: 100, height: 100)
            
            Image("ProfileSilhoutte")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .clipShape(Capsule(style: .continuous)) // mask image inside shape
            
            Image("ProfileSilhoutte")
                .resizable()
                .frame(width: 100, height: 100)
                .mask {
                    Rectangle() // masking the image inside this shape
                        .cornerRadius(16)
                }
        }
    }
}

#Preview {
    ShapeView()
}
