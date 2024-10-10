//
//  LoggedInViewModel.swift
//  NewTestProject
//
//  Created by Gdwn on 08/10/2024.
//

import Foundation

// we use the Equatable protocol because
// we want to compare changes in the struct using the onChange modifier
// structs don't allow this by default.

struct User : Equatable {
    var username : String = ""
    var password : String = ""
    
    // reset the values of the username and password
    mutating func reset() {
        self.username = ""
        self.password = ""
    }    
}

final class LoggedInViewModel : ObservableObject {
    
    enum currentStatus {
        // define all the states an object can be in
        case notLoggedIn
        case loading
        case loggedIn
    }
    
//        @Published var user : User = .init()  // this also works
    @Published var user = User()
    @Published var currentState : currentStatus = .notLoggedIn
    
    func login() {
        // check whether username is not empty
        // if they are, return
        guard !user.username.isEmpty && !user.password.isEmpty else {
            return
        }
        
        self.currentState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            [weak self] in
            self?.currentState = .loggedIn
        }
    }
    
    func logout() {
        self.currentState = .notLoggedIn
        self.user.reset() // reset the username and password
    }
}


// the below code will work but
// enums (used above) does the job better and neater

//final class LoggedInViewModel : ObservableObject {
//    
////        @Published var user : User = .init()  // this also works
//    @Published var user = User()
//    @Published var isLoading : Bool = false
//    @Published var isLoggedIn : Bool = false
//    
//    func login() {
//        // check whether username is not empty
//        // if they are, return
//        guard !user.username.isEmpty && !user.password.isEmpty else {
//            return
//        }
//        
//        isLoading = true
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            [weak self] in
//            self?.isLoading = false
//            self?.isLoggedIn = true
//        }
//    }
//    
//    func logout() {
//        self.isLoggedIn = false
//    }
//}
