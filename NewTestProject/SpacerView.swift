//
//  SpacerView.swift
//  NewTestProject
//
//  Created by Gdwn on 12/10/2024.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        
        // Spacer() just adds a space the fills the container
        // you can't apply modifiers like background color etc.
        // as Spacer() doesn't get rendered on the screen.
        
        HStack {
            Text("Hello, World!")
            Spacer() // adds a space that fills the container
            Text("Another hello")
        }
        .padding()
        
        HStack { // set the content to start from top
            Text("Date")
            Spacer(minLength: 20)
            Text("12th October 2024 and this can keep going on forever")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
        .background(Color("Surface1"))

        HStack (alignment: .top) { // set the content to start from top
            Text("Date")
            Spacer(minLength: 20)
            Text("12th October 2024 and this can keep going on forever")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .background(Color("Surface1"))
        
        VStack {
            Text("Hello!")
            Spacer() // fills the space vertically
            Text("Hello at the bottom")
        }
        .padding()
    }
}

#Preview {
    SpacerView()
}
