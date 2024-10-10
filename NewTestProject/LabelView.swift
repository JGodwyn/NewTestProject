//
//  LabelView.swift
//  NewTestProject
//
//  Created by Gdwn on 10/10/2024.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        VStack {
            Label("Pick a color", systemImage: "paintpalette.fill")
            Label("Godwin John", image: "ProfileIcon") // can't set image dimension
            
            // this also works
            Label{
                Text("Face with monocle")
            } icon: {
                Image("face-with-monocle")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            Link(destination: .init(string: "https://github.com/JGodwyn")!) {
                Label {
                    Text("View my Github profile")
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                        .background(Color("AccentColor"))
                        .cornerRadius(12)
                } icon: {
                    Image("ProfileIcon")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                }
            }
            
            // Adding the custom style I created in LabelCapsuleStyle
            Label("Pick a color", image: "ProfileIcon")
                .labelStyle(CapsuleStyle())
            
            Label("Pick a color", image: "ProfileIcon")
                .labelStyle(InitialStyle())
            
            Label("Pick a color", image: "ProfileIcon")
                .labelStyle(SecondCapsuleStyle())
            
            Label("Pick a color", image: "ProfileIcon")
                .labelStyle(ThirdCapsuleStyle(backgroundColor: .green, textColor: .white))
            
            Label("Pick a color", image: "ProfileIcon")
                .labelStyle(ThirdCapsuleStyle(backgroundColor: .purple, textColor: .white))
            // I can hide the icon or title
            // I can also set this to automatic to let the system decide
                .labelStyle(.iconOnly)
        }
    }
}

#Preview {
    LabelView()
}
