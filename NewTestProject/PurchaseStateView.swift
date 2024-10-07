//
//  PurchaseStateView.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import SwiftUI

struct PurchaseStateView: View {
    
    // still points to the same purchaseVm declared in PurchaseView
    // I can use any name other than purchaseVm (eg newVm) and it still
    // points to the same object
    @EnvironmentObject var purchaseVm : PurchaseViewModel
    
    var body: some View {
        
        // I can just add PurchaseStatusView here without needing to add any modifiers
        // Isn't this normally how it's supposed to be?
        // for some reason the tutor had to mention this
        // the main logic is in PurchaseStatusView
        PurchaseStatusView()
    }
}

#Preview {
    PurchaseStateView()
        .environmentObject(PurchaseViewModel())
}
