//
//  ContentView.swift
//  NewTestProject
//
//  Created by Gdwn on 01/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    // using Environment Object
    @EnvironmentObject var loginVm : LoginViewModel
    
    // Using State Object
    // for environment object, something similar
    // to this was defined at the root file
    @StateObject private var loggedInVm = LoggedInViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome to my app")
                .font(.system(size: 27))
                .bold()
                .padding(32)
            
            // using environment object
            Text("Using environment object")
            // login button
            // another way of writing buttons
            // this allows me to use ProgressView in the label
            Button {
                withAnimation {
                    loginVm.login()
                }
            } label : {
                if (loginVm.isLoading && !loginVm.isLoggedIn) {
                    // checks whether it is loading and is not logged in
                    ProgressView()
                        .tint(.white) // change color to white
                } else {
                    Text("Login")
                }
            }
            .disabled(loginVm.isLoggedIn)
            .opacity(loginVm.isLoggedIn ? 0.4 : 1)
            .foregroundColor(Color.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(loginVm.isLoggedIn ? Color.gray : Color("AccentColor"))
            .cornerRadius(8)
            
            
            // logout button
            Button {
                withAnimation {
                    loginVm.logout()
                }
            } label : {
                if (loginVm.isLoading && loginVm.isLoggedIn) {
                    ProgressView()
                        .tint(.white) // change color to white
                } else {
                    Text("Logout")
                }
            }
            .disabled(!loginVm.isLoggedIn)
            .opacity(loginVm.isLoggedIn ? 1 : 0.4)
            .foregroundColor(Color.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(loginVm.isLoggedIn ? Color.red : Color.gray)
            .cornerRadius(8)
            
            
            // Using the latest binding view
            
            Text("Using Binding View").padding(.top, 32)
            
            switch loggedInVm.currentState {
                case .loading : 
                    ProgressView()
                case .loggedIn : 
                    LoggedInView() { loggedInVm.logout() }
                case .notLoggedIn :
                    LoginView(user: $loggedInVm.user) { loggedInVm.login() }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ContentView()
        .environmentObject(LoginViewModel())
}


// another of showing your previews
// this way you can build multiple previews as shown below
// I can't figure out the way to do it on the one above

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//            .previewDevice("iPhone 13 main") // I can set the preview device I want here
//
//        ContentView()
//            .preferredColorScheme(.light)
//
//        ContentView()
//            .previewDevice("iPhone SE (3rd generation)")
//    }
//}
