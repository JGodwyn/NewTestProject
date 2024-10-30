//
//  IdentifiableView.swift
//  NewTestProject
//
//  Created by Gdwn on 30/10/2024.
//

import SwiftUI

struct MainPerson : Identifiable {
    let id = UUID()
    let firstname : String
    let lastname : String
}

struct IdentifiableView: View {
    
    @State private var people : [MainPerson] = []
    
    var body: some View {
        VStack {
            Text("Here's your list")
                .bold()
                .padding(.bottom, 16)
            
                PersonView(data: people)
            //forEach loop is inside the PersonView
        }
        .onAppear {
            // when the VStack appears, execute this
            self.people = MainPerson.exampleData
        }
    }
}

#Preview {
    IdentifiableView()
}


extension MainPerson {
    
    // computed properties acts like funcs that calculate and return something to whatever is calling them
    // think of them as struct
    // static means you can call the property without creating an instance of the struct
    // that's why here it seems like I am creating an instance of the struct itself
    // I can pass this computed property to any object and it's almost like initializing
    // it with whatever is defined in the static property body
    static var exampleData : [MainPerson] {
        [
            MainPerson(firstname: "Godwin", lastname: "John"),
            MainPerson(firstname: "Godwin", lastname: "Nzubechukwu"),
            MainPerson(firstname: "Jessica", lastname: "Green"),
            MainPerson(firstname: "Jonah", lastname: "Blue"),
            MainPerson(firstname: "Micah", lastname: "Red"),
        ]
    }
}
