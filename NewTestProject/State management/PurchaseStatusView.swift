//
//  PurchaseStatusView.swift
//  NewTestProject
//
//  Created by Gdwn on 07/10/2024.
//

import SwiftUI

struct PurchaseStatusView: View {
    
    @EnvironmentObject var purchaseVm : PurchaseViewModel
    
    var body: some View {
        VStack {
            Image(systemName: purchaseVm.hasPurchased ? "lock.open" : "lock")
                .font(.system(size: 64))
                .symbolVariant(.fill)
                .padding()
            Text("The user has \(purchaseVm.hasPurchased ? "" : "not") unlocked this feature")
                .frame(width: 200)
                .multilineTextAlignment(.center) // align center
            
            // this will work
            Button ("Toggle purchase state") {
                withAnimation {
                    purchaseVm.hasPurchased.toggle()
                }
            }
            .padding()
        }
    }
}

#Preview {
    PurchaseStatusView()
        .environmentObject(PurchaseViewModel())
}
