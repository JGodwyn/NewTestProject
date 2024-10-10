//
//  DividerView.swift
//  NewTestProject
//
//  Created by Gdwn on 10/10/2024.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        VStack {
            VStack {
                Text("This is a divider")
                Divider()
                    .frame(width: 100, height: 12)
            }
            .padding()
            .background(Color.yellow)
            
            Group {
                Text("This is another divider")
                Divider()
            }
            .background(Color.mint)
            .padding()
            // group applies whatever modifiers to every element within it
            // think of it as groups in Figma
            
            HStack {
                Text("Sunny day")
                Divider()
                    .frame(width: 1, height: 24) // increase the thickness and height
                    .background(Color.gray) // you need to add background to see the thickness
                Image(systemName: "sun.min")
                    .font(.system(size: 24))
                    .foregroundColor(Color.yellow)
            }
        }
        .padding()
    }
}

#Preview {
    DividerView()
}
