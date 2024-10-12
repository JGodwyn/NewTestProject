//
//  ToggleView.swift
//  NewTestProject
//
//  Created by Gdwn on 11/10/2024.
//

import SwiftUI

struct ToggleView: View {
    
    @State private var isToggled : Bool = false
    
    var body: some View {
        
        VStack {
            Text("Current state : \(isToggled ? "on" : "off")")
                .font(.system(size: 20))
                .bold()
            
            // #1
            Toggle("Turn me on and keep turning me on forever until I can no longer be turned on", isOn: $isToggled)
                .padding()
                .background(Color("Surface1"))
                .cornerRadius(16)
            
            // #2
            Toggle("Turn me on", isOn: $isToggled)
                .labelsHidden() // I can hide the label
            
            // #3
            Toggle (isOn: $isToggled) {
                Label("Is this thing on?", systemImage: "lightbulb")
                    .symbolVariant(isToggled ? .fill : .none)
            }
            
            // #4
            Toggle (isOn: $isToggled) {
                Label("Is this thing on?", systemImage: "lightbulb")
                    .symbolVariant(isToggled ? .fill : .none)
            }
            .toggleStyle(.button) // change the toggle style
            
            // #5
            Toggle (isOn: $isToggled) {
                Label ("Turn toggle on", systemImage: "lightbulb")
            }
            .toggleStyle(InitialToggleStyle())
            
            // #6
            Toggle (isOn: $isToggled) {
                Label {
                    Text("This label")
                } icon: {
                    Image("ProfileIcon")
                }
            }
            .toggleStyle(SecondToggleStyle())
            
            // #7
            Toggle ("This should work", isOn: $isToggled)
                .toggleStyle(ThirdToggleStyle())
            
            // #8
            Toggle ("Toggle this checkmark", isOn: $isToggled)
                .toggleStyle(FourthToggleStyle())
            
            // #9
            // what I wanted to get!
            Toggle ("Turn me on and keep turning me on forever until I can no longer be turned on", isOn: $isToggled)
                .toggleStyle(FifthToggleStyle())
            
            // I can also do this
            VStack {
                Toggle ("Turn me on", isOn: $isToggled)
                Toggle ("Turn me on", isOn: $isToggled)
                Toggle ("Turn me on", isOn: $isToggled)
            }
            .toggleStyle(FifthToggleStyle())
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ToggleView()
}
