//
//  PurchaseView.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import SwiftUI

struct PurchaseView: View {
    
    // create an environment object here
    @EnvironmentObject var purchaseVm : PurchaseViewModel
    
    // the wild thing is we donk't even use evm we declared
    // in the root file anywhere here
    
    var body: some View {
        
        if purchaseVm.isLoading {
            ProgressView()
        } else {
            Button ("Purchase me") {
                purchaseVm.purchase()
            }
            .disabled(purchaseVm.hasPurchased)
            .opacity(purchaseVm.hasPurchased ? 0.5 : 1)
        }
    }
}

// you neeed to add the .enviromentObject for this to work on previews
// add it everywhere you are using an environment object
// else the app will crash!
// you need to build your app to see the environment object in action though
#Preview {
    PurchaseView()
        .environmentObject(PurchaseViewModel())
}
