//
//  Symbolview.swift
//  NewTestProject
//
//  Created by Gdwn on 01/10/2024.
//

import SwiftUI

struct Symbolview: View {
    @State private var isLogic = false
    
    var body: some View {
        // remember that SF symbols are like icons
        // so you can use font modifiers to edit themm
        Image(systemName: "cloud.sun")
            .symbolVariant(.fill) // change the symbol type
        
        // I applied modifiers to the VStack below
        VStack {
            VStack{
                Image(systemName: "cloud.sun")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.yellow, Color.blue) // I can change the colors I want for palette
                
                Label("Cloudy day", systemImage: "cloud.sun")
                    .imageScale(.small) // this only affects the image hmmm...
                    .symbolRenderingMode(.monochrome) // the rendering mode
                
                Label("Cloudy day", systemImage: "cloud.sun")
                    .imageScale(.medium)
                    .symbolRenderingMode(.hierarchical)
                
                Label("Cloudy day", systemImage: "cloud.sun")
                    .imageScale(.large)
                    .symbolRenderingMode(.palette)
                
                Label("Cloudy day", systemImage: "cloud.sun")
                    .imageScale(.large)
                    .symbolRenderingMode(.multicolor)
            }
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .background(Color.teal)
            
            // this is a better way to write a button
            Button("Change color to " + (isLogic ? "red" : "blue")) {
                withAnimation {
                    isLogic.toggle()
                }
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.black)
        }
        .foregroundColor(isLogic ? Color.blue : Color.red)
        .font(.system(size: 20, weight: .medium))
        .padding()
        
    }
}

#Preview {
    Symbolview()
}
