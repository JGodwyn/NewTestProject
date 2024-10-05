//
//  UsingColorsView.swift
//  NewTestProject
//
//  Created by Gdwn on 02/10/2024.
//

import SwiftUI

struct UsingColorsView: View {
    @State private var isLogic = false
    
    var body: some View {
        
        VStack {
            // there are many ways to write colors in SwiftUi
            Text("Hello, World! what is going on here")
                .padding()
                .foregroundColor(Color.white) // doesn't work with user-added colors
                .background(Color.accentColor) // notice how I wrote "accentColor"
            
            Text("Testing out secondary color")
                .foregroundColor(Color("Secondary")) // only works with user-generated colors
            
            Text("Using a new nomenclature")
                .foregroundColor(Color("AccentColor")) // notice how I wrote "AccentColor"
            
            Text("Using another nomenclature")
                .foregroundColor(Color.accentColor) // only works with user-added colors
            
            // buttons automatically inherit your accent(primary) color
            Button ("Do something"){
                withAnimation {
                    isLogic.toggle() 
                }
            }
        }
        
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea() // you can apply modifiers to colors
            Text("You good?")
                .foregroundColor(Color.white)
        }
    }
}

#Preview {
    UsingColorsView()
}
