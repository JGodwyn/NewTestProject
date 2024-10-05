//
//  ContentView.swift
//  NewTestProject
//
//  Created by Gdwn on 01/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }.padding()
            
            Text("Render on all devices")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


// another of showing your previews
// this way you can build multiple previews as shown below
// I can't figure out the way to do it on the one above
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 main") // I can set the preview device I want here
        
        ContentView()
            .preferredColorScheme(.light)
        
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
