//
//  LoggedInView.swift
//  NewTestProject
//
//  Created by Gdwn on 08/10/2024.
//

import SwiftUI

struct LoggedInView: View {
    
    let tappedLogout : () -> Void
    
    var body: some View {
        VStack {
            Text("Hey, you're now logged in")
        }
        
        Button ("Logout") {
            tappedLogout()
        }
        .padding(.vertical)
    }
}

#Preview {
    LoggedInView(){}
}
