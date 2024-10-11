//
//  LabelCapsuleStyle.swift
//  NewTestProject
//
//  Created by Gdwn on 10/10/2024.
//

import Foundation
import SwiftUI // make sure to import swiftUI


struct InitialStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        // this valid code though (don't know if it the best way to implement it
        // see that I can change the position of the icon and text
        HStack {
            // I can edit the icon
            // although only SFSymbol modifiers work on it
            // I can't resize it for some reason
            configuration.icon
                .clipShape(Circle())
            
            
            configuration.title
                .padding()
                .foregroundColor(.white)
                .background(Color("AccentColor"))
                .clipShape(Capsule())
        }
    }
}


struct CapsuleStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        // editing the whole label
        Label(configuration)
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .clipShape(Capsule())
    }
}


struct SecondCapsuleStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        // this will work but I don't know if it is the best way
        HStack {
            Label {
                configuration.title // set the title style
                    .padding()
                    .foregroundColor(.white)
    //                .background(Color("AccentColor"))
            } icon : {
                configuration.icon // set the icon style (I can't resize this also)
                    .font(.system(size: 32))
                    .clipShape(Circle())
            }
        }
        .background(Color("AccentColor"))
    }
}


// this is the style the tutor defined
struct ThirdCapsuleStyle : LabelStyle {
    let backgroundColor : Color
    let textColor : Color
    
    func makeBody(configuration: Configuration) -> some View {
        // here, I am editing the label itself, the icon, and the text
        Label {
            configuration.title // set the title style
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(textColor)
        } icon : {
            configuration.icon // set the icon style
        }
        .padding()
        .background(backgroundColor)
        .clipShape(Capsule())
    }
}


struct ChooseColor : LabelStyle {
    let text : Color
    let icon : Color
    
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
                .foregroundColor(text)
        } icon: {
            configuration.icon
                .foregroundColor(icon)
            
        }
    }
}
