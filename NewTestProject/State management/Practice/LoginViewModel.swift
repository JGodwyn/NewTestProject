//
//  LoginViewModel.swift
//  NewTestProject
//
//  Created by Gdwn on 07/10/2024.
//

import Foundation

final class LoginViewModel : ObservableObject {
    
    // make two variables accessible
    @Published var isLoading : Bool = false
    @Published var isLoggedIn : Bool = false
    
    func login () {
        isLoading = true
        
        // just to simulate loading, I add a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            [weak self] in
            self?.isLoggedIn = true
            self?.isLoading = false
        }
    }
    
    func logout () {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            [weak self] in
            self?.isLoggedIn = false
            self?.isLoading = false
            
        }
    }
}
