//
//  LoginView.swift
//  NewTestProject
//
//  Created by Gdwn on 08/10/2024.
//

import SwiftUI

// essentially, what I am doing here is…
// creating a component that has a binding to User
// user's variables is used in the text field
// this is easy to understand

struct LoginView: View {
    
    // just like the way you bind to Boolean
    // now you're binding to the user struct
    @Binding var user : User
    
    // lets me know when something was tapped
    let tappedLogin : () -> Void
    
    var body: some View {
        VStack {
            TextField ("Username",
                       // why do I have to unwrap this here?
                       // it seems "text:" only accepts a binding object
                       text: $user.username,
                       prompt: Text("Username"))
            
            SecureField ("Password",
                         text: $user.password,
                         prompt: Text("Password")
            )
            
            Button {
                // if you notice, there's no way this has access to
                // the loggedInViewModel login() func
                // so it cannot call the login function.
                // But this is a button that should do just that
                // the way to do this is to notify the view using this component
                // that the button has been tapped.
                // we do this via closures
                tappedLogin() // lets me know when this button was tapped
            } label : {
                Text("Login")
            }
            .padding(.vertical, 24)
        }
        .padding(.horizontal, 24)
        .textFieldStyle(.roundedBorder)
        .onChange(of: user) {
            // if user changes, print it to the console.
            print("The user entered \(user)")
        }
    }
}

#Preview {
    // call the initializer as a contant
    // also easy to understand
    // because I added the tappedLogin() closure, I have to add "{}"
    LoginView(user: .constant(.init())) {}
}
