//
//  PeopleViewModel.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import Foundation

// final cos you don't want any class to inherit from this class
// class because you wnat it to be a reference type
// creating an instance and changing a value
// will update the values of all other instance
// ObservableObject because you want to listen to changes
final class PeopleViewModel : ObservableObject {
    
    // publish these items
    @Published var isLoading : Bool = false
    @Published var people : [String] = []
    
    func fetchPeople() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.people = ["Godwin", "John", "Nzubechukwu"]
            self.isLoading = false
        }
    }
    
}


// can't inherit from a final class
//class SomeModel : PeopleViewModel {}
