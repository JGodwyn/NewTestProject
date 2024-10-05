//
//  PurchaseStateView.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import SwiftUI

struct PurchaseStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "lock")
                .font(.system(size: 64))
                .symbolVariant(.fill)
                .padding()
            Text("The user hasn't unlocked this feature")
                .frame(width: 200)
                .multilineTextAlignment(.center) // align center
        }
    }
}

#Preview {
    PurchaseStateView()
}
