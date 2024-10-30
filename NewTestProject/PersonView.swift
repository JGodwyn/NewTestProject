//
//  PersonView.swift
//  NewTestProject
//
//  Created by Gdwn on 30/10/2024.
//

import SwiftUI

struct PersonView: View {
    
    var data : [MainPerson]
    
    var body: some View {
        VStack {
            ForEach(data, id: \.id) {
                item in
                Text("\(item.firstname) \(item.lastname)")
            }
        }
    }
}

#Preview {
    PersonView(data: MainPerson.exampleData)
}
