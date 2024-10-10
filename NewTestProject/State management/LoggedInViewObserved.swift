//
//  LoggedInViewObserved.swift
//  NewTestProject
//
//  Created by Gdwn on 10/10/2024.
//

import SwiftUI

struct LoggedInViewObserved: View {
    
    @ObservedObject var observedVm : LoggedInViewModel
    
    var body: some View {
        VStack {
            Text("Hey, you're now logged in")
        }
        
        Button ("Logout") {
            observedVm.logout()
            
        }
        .padding(.vertical)
    }
}

#Preview {
    LoggedInViewObserved(observedVm: .init())
}
