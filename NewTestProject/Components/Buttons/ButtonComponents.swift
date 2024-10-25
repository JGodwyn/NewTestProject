//
//  PlainButton.swift
//  NewTestProject
//
//  Created by Gdwn on 16/10/2024.
//

import SwiftUI


struct MainButton : View {
    
    let btnLabel : String
    let color : Color
    let height : CGFloat
    let fillContainer : Bool
    let tappedButton : () -> Void
    
    // initialize with label, color, fillContainer, and function
    // default values are set for all of these except function
    init(label: String = "No label",
         color: Color = .accentColor,
         height: CGFloat = 40,
         fillContainer: Bool = false,
         action: @escaping () -> Void) {
            self.btnLabel = label
            self.color = color
            self.height = height
            self.fillContainer = fillContainer
            self.tappedButton = action
    }
    
    var body: some View {
        Button (action: tappedButton) {
            Text(btnLabel)
                .frame(maxWidth: fillContainer ? .infinity : .none)
        }
        .buttonStyle(MainButtonStyle(color: color, height: height))
    }
}


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
        PlainButton(btnLabel: .init("Plain button")){}
        IconLabelButton(btnLabel: .init("Icon button"), btnImage: .init("button.programmable")){}
        //        MainButton(btnLabel: .init("Main button"), color: .init(.blue)){}
        MainButton(){}
        MainButton(label: "Default button"){}
        MainButton(label: "Red button", color: .red){}
        MainButton(label: "Green button", color: .green, fillContainer: true){}
        MainButton(label: "Green button", color: .green, height: 48, fillContainer: true){}
    }
    .padding(8)
}
