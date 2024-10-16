//
//  PlainButton.swift
//  NewTestProject
//
//  Created by Gdwn on 16/10/2024.
//

import SwiftUI

struct PlainButton: View {
    
    let btnLabel : String // label on button
    let tappedButton : () -> Void // when they tap the button
    
    var body: some View {
        Button (action: tappedButton) {
            Text(btnLabel)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct IconLabelButton : View {
    
    let btnLabel : String  // label on button
    let btnImage : String // image on button
    let tappedButton : () -> Void // when they tap the button
    
    // see what happens here
    // in the PlainButtonStyle declaration, I already have an HStack
    // Here, I added another one to place my icon in.
    var body: some View {
        Button (action: tappedButton){
            HStack {
                Image(systemName: btnImage)
                Text(btnLabel)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
}


#Preview {
    Group {
        PlainButton(btnLabel: .init("Label")){}
        IconLabelButton(btnLabel: .init("Label"), btnImage: .init("button.programmable")){}
    }
}
