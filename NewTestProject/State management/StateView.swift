//
//  StateView.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import SwiftUI

struct StateView: View {
    @State private var isOn : Bool = false
    
    var body: some View {
        Image(systemName: "lightbulb")
            .font(.system(size: 48))
            .symbolVariant(isOn ? .fill : .none)
            .foregroundColor(isOn ? Color.yellow : Color.black)
        
        Toggle(isOn : $isOn) {
            Text("Toggle light switch")
        }
        .labelsHidden() // hide the label
        
        // even when I am changing the value of isOn below
        // it changes the state of the toggle above
        // is it because it is bound to it using $?
        Button("Toggle lightbulb") {
            withAnimation {
                isOn.toggle()
            }
        }
        .foregroundColor(Color.white)
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color("AccentColor"))
        .cornerRadius(12)
    }
}

#Preview {
    StateView()
}
