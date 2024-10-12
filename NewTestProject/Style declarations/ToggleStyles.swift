//
//  ToggleStyles.swift
//  NewTestProject
//
//  Created by Gdwn on 12/10/2024.
//

import Foundation
import SwiftUI

// the thing here is you can define almost element inside the makeBody func
// you can even mix HStacks and VStacks lol
// just like I did below

struct InitialToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.red)
    }
}


struct SecondToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label ("Turn toggle on", systemImage: "lightbulb")
            .foregroundColor(.purple)
    }
}


struct ThirdToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // don't know if this is the right way of doing it.
        HStack {
            Image (systemName: "checkmark.square")
            configuration.label
                .foregroundColor(.black)
                .symbolVariant(configuration.isOn ? .fill : .none) // I can access the current state of the toggle (configuration.isOn) and create logic based on it
        }
    }
}


struct FourthToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle() // I can toggle the value like this
        } label: {
            Image (systemName: "checkmark.square")
                .symbolVariant(configuration.isOn ? .fill : .none)
            configuration.label
                .foregroundColor(.black)
        }
//        .tint(.red) // you can use Tint on a button
    }
}


// this is what I was looking for
struct FifthToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .frame(maxWidth: .infinity, alignment: .leading)
            Toggle("", isOn: configuration.$isOn)
                .labelsHidden()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color("Surface1"))
        .cornerRadius(16)
    }
}
