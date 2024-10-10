//
//  ColorPickerView.swift
//  NewTestProject
//
//  Created by Gdwn on 10/10/2024.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var avatarColor = Color.yellow
    @State private var backgroundColor = Color("Surface0")
    
    var body: some View {
        
        VStack {
            Text("This for color picker")
                .padding()
            VStack {
                Image("ProfileSilhoutte")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
            .frame(width: 150, height: 150)
            .background(avatarColor)
            .clipShape(Circle())
            
            PickerList(listName: "Avatar color", colorSelection: $avatarColor)
            PickerList(listName: "Background color", colorSelection: $backgroundColor)
            
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(backgroundColor)
        .ignoresSafeArea()
    }
}

struct PickerList : View {
    let listName : String // name to use on the list
    
    @Binding var colorSelection : Color
    
    var body: some View {
        VStack {
            ColorPicker(selection: $colorSelection, supportsOpacity: false) {
                Label(listName, systemImage: "paintpalette")
                    .symbolVariant(.fill)
            }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color("Surface1"))
                .cornerRadius(8)
        }
    }
    
    // I don't know how to use this lol
    // But I wanted a way to change the label of PickerList
    // and the symbol also
    func changeLabel (label : String) -> String {
        let listLabel : String = label
        return listLabel
    }
    
}

#Preview {
    ColorPickerView()
}
