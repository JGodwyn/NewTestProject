//
//  PeopleViewModel.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import Foundation

// use this when you want to create some kind of functionality outside your class
// such that a view from any file can access it
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
            // [weak self] is a convention that works for memory management
            // you are telling Swift to capture self as a weak reference
            // (so it can deallocated later to manage memmory)
            // "in" separates the return type and parameters from the executable body of code
            // in this case, we are not returning anything
            // just setting values for isLoading and people
            // you use ? after self because there's a chance that
            // the reference can become nil (optionals). So we need to account for that
            [weak self] in
            self?.people = ["Godwin", "John", "Nzubechukwu"]
            self?.isLoading = false
            
            // using strong references, we can write like this
            //            self.people = ["Godwin", "John", "Nzubechukwu"]
            //            self.loading = false
        }
    }
    
}


// can't inherit from a final class
//class SomeModel : PeopleViewModel {}
