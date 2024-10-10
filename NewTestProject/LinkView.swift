//
//  LinkView.swift
//  NewTestProject
//
//  Created by Gdwn on 10/10/2024.
//

import SwiftUI

struct LinkView: View {
    var body: some View {
        Text("Time to link a few things")
        
        // this is how you define a link to open in a external site
        // I added a "!"  at the end cos I have to force unwrap the string for it to work
        Link("Github profile", destination: .init(string: "https://github.com/JGodwyn")!)
            .font(.title) // I can add modifiers here
            .foregroundColor(.red)
            .padding(.vertical, 12)
        
        // you can add even more customization like this
        Link(destination: URL(string: "https://github.com/JGodwyn")!, label: {
            Image("ProfileSilhoutte")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        })
        
        // or do it like, the same as the one above
        // just slight difference
        Link(destination: .init(string: "https://github.com/JGodwyn")!) {
            Image("face-with-monocle")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        }
    }
}

#Preview {
    LinkView()
}
