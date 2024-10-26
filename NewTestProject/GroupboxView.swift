//
//  GroupboxView.swift
//  NewTestProject
//
//  Created by Gdwn on 26/10/2024.
//

import SwiftUI

struct GroupboxView: View {
    var body: some View {
        VStack {
            GroupBox("Saved Items") { // adds a gray box for you
                VStack {
                    Text("This is item 1")
                    Text("This is item 2")
                    Image(systemName: "calendar")
                    Image("ProfileSilhoutte")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding()
            }
            
            // Personalizing my title by adding a custom label
            GroupBox {
                VStack {
                    Text("What is happening?")
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            } label: {
                HStack {
                    Image(systemName: "person.fill")
                    Text("My grouped box")
                }
                .padding(.bottom, 8)
            }
            
            
            // using the groupbox style
            GroupBox ("Your items") {
                Text("Here are your items")
                Text("Here are your items")
                Text("Here are your items")
            }
            .groupBoxStyle(GroupboxVerticalStyle())
        }
        .padding()
        .background(.red)
    }
}

#Preview {
    GroupboxView()
}
