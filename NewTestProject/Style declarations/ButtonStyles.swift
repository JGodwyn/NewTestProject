//
//  ButtonStyles.swift
//  NewTestProject
//
//  Created by Gdwn on 14/10/2024.
//

import Foundation
import SwiftUI


struct SendButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: "paperplane")
                .symbolVariant(.fill)
            Divider()
                .padding(.vertical, 8)
                .background(.white)
            configuration.label
        }
        .padding()
        .frame(width: 200, height: 40)
        .foregroundColor(.white)
        .background(Color("AccentColor"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .opacity(configuration.isPressed ? 0.7 : 1) // have the click effect
        .scaleEffect(configuration.isPressed ? 0.9 : 1) // slightly scale down
        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed) // animate it
        
    }
}

struct PlainButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .padding()
        .frame(height: 40)
        .foregroundColor(.white)
        .background(Color("AccentColor"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .opacity(configuration.isPressed ? 0.7 : 1) // have the click effect
        .scaleEffect(configuration.isPressed ? 0.5 : 1) // slightly scale down
        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed) // animate it
    }
}

struct MainButtonStyle : ButtonStyle {
    
    var color : Color
    var height : CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(height: height)
//        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .opacity(configuration.isPressed ? 0.7 : 1) // have the click effect
        .scaleEffect(configuration.isPressed ? 0.5 : 1) // slightly scale down
        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed) // animate it
    }
}


//struct IconLabelButtonStyle : ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        HStack {
//            Image(systemName: "paperplane")
//                .symbolVariant(.fill)
//            Divider()
//                .padding(.vertical, 8)
//                .background(.white)
//            configuration.label
//        }
//        .padding()
//        .frame(height: 40)
//        .foregroundColor(.white)
//        .background(Color("AccentColor"))
//        .clipShape(RoundedRectangle(cornerRadius: 16))
//        .opacity(configuration.isPressed ? 0.7 : 1) // have the click effect
//        .scaleEffect(configuration.isPressed ? 0.7 : 1) // slightly scale down
//        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed) // animate it
//    }
//}


extension ButtonStyle where Self == SendButtonStyle {
    // this makes it so I can use something like…
    // .buttonStyle(.send) instead of .buttonStyle(.SendButtonStyle())
    // works the same for every style declaration
    // but if I have so many of them, I have to do this?
    static var send : SendButtonStyle {.init()}
}
