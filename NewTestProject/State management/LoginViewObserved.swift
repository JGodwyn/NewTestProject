//
//  LoginViewObserved.swift
//  NewTestProject
//
//  Created by Gdwn on 10/10/2024.
//

import SwiftUI

struct LoginViewObserved: View {
    
    // using the @ObservedObject
    // this points to LoggedInViewModel
    // you'll need to connect this in the view where it is used
    @ObservedObject var observedVm : LoggedInViewModel
    
    var body: some View {
        // the same as LoginView but using @ObservedObject
        VStack {
            TextField ("Username",
                       // why do I have to unwrap this here?
                       // it seems "text:" only accepts a binding object
                       text: $observedVm.user.username,
                       prompt: Text("Username"))
            
            SecureField ("Password",
                         text: $observedVm.user.password,
                         prompt: Text("Password")
            )
            
            Button {
                // i can access the login func from LoggedInViewModel directly
                observedVm.login() // lets me know when this button was tapped
            } label : {
                Text("Login")
            }
            .padding(.vertical, 24)
        }
        .padding(.horizontal, 24)
        .textFieldStyle(.roundedBorder)
        .onChange(of: observedVm.user) {
            // if user changes, print it to the console.
            print("The user entered \(observedVm.user)")
        }
    }
}

#Preview {
    LoginViewObserved(observedVm: .init()) // use it this way
}
