//
//  BorderView.swift
//  NewTestProject
//
//  Created by Gdwn on 04/10/2024.
//

import SwiftUI

// In summary, use .border() for simple borders around non-shape views, while stroke() and strokeBorder() are better suited for more complex shapes where you need precise control over how borders are rendered.
// stroke is like center-stroke in Figma
// strokeBorder is like inner-stroke in Figma


struct BorderView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .border(.red, width: 4)
                .cornerRadius(8) // this has a weird edge around it
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("Secondary")) // always apply this first
                .stroke(Color("AccentColor"), lineWidth: 4) // must add this first (except there is a fill
                .frame(width: 100, height: 100)
            
            Circle()
                .stroke( // applies it to the center
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color("Secondary")]),
                        startPoint: .top,
                        endPoint: .bottom), lineWidth : 8)
                .frame(width: 100, height: 100)
            
            
            Circle()
                .strokeBorder( // applies the stroke inside the shape
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color("Secondary")]),
                        startPoint: .top,
                        endPoint: .bottom)
                    , lineWidth: 8) // diff btw this and stroke???
                .frame(width: 100, height: 100)
            
            Text("Hello World again!")
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        // has a well rounded stroke now
                        .stroke(Color("AccentColor"), lineWidth: 4))
            
            Text("Hello World again!")
                .foregroundColor(.white) // I can't see my text
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12))
            
            Text("how are you?")
                .padding()
                .overlay(
                    Rectangle()
                        .stroke(Color("AccentColor"), lineWidth: 4)
                )
            
            // this has the same effect as using an overlay
            Text("Hello world using background")
                .foregroundColor(Color.white)
                .padding()
                .background(Color("AccentColor"))
                .cornerRadius(16)
                .frame(width: 200)
            
            // this also has the same effect as using an overlay
            ZStack {
                Text("Hello world using ZStack")
                    .foregroundColor(Color.white)
            }
            .padding()
            .background(Color("AccentColor"))
            .cornerRadius(16)
            .frame(width: 200) // almost like setting a max-width
        }
    }
}

#Preview {
    BorderView()
}
