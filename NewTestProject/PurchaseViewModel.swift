//
//  PurchaseViewModel.swift
//  NewTestProject
//
//  Created by Gdwn on 06/10/2024.
//

import Foundation

// you will define an instance of this on the root file of your app
// to use it as an environment object every can listen to changes

final class PurchaseViewModel : ObservableObject {
    @Published var hasPurchased : Bool = false
    @Published var isLoading : Bool = false
    
    func purchase() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            [ weak self ] in
            self?.isLoading = false
            self?.hasPurchased = true
        }
    }
    
}
