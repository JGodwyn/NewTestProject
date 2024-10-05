//
//  ObservableView.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import SwiftUI

struct ObservableView: View {
    
    @State private var people : [String] = []
    @State private var isLoading : Bool = false
    
    // using an external model (mind the declaration)
    @StateObject private var vm = PeopleViewModel()
    @StateObject private var vm2 = PeopleViewModel() // different from vm2
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                Text("Loading…")
                    .padding()
            } else {
                Text(people.isEmpty ? "No users found" : "Managed to get \(people.joined(separator: ", "))")
                    .padding()
            }
            
            Button ("Fetch users"){
                withAnimation {
                    fetchPeople()
                }
            }.padding()
            
            Text("Using an external model below")
                .font(.system(size: 20, weight: .bold))
            
            
            // using an external class
            if vm.isLoading {
                ProgressView()
                Text("Loading…")
                    .padding()
            } else {
                Text(vm.people.isEmpty ? "No users found" : "Managed to get \(vm.people.joined(separator: ", "))")
                    .padding()
            }
            
            Button ("Fetch users externally") {
                withAnimation {
                    vm.fetchPeople()
                }
            }
        }
    }
}

// using a model internally
// I can't use this for a view outside this file
private extension ObservableView {
    func fetchPeople() {
        isLoading = true
        
        // run after the delay specified here
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            people = ["Godwin", "John", "Nzubechukwu"]
            isLoading = false
        }
    }
}

#Preview {
    ObservableView()
}
