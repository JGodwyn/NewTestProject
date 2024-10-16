//
//  NewTestProjectApp.swift
//  NewTestProject
//
//  Created by Gdwn on 01/10/2024.
//

import SwiftUI

@main
struct NewTestProjectApp: App {
    
    // define it as usual
    // but since it is declared at the root of your app
    // you can inject it to any scrren and they'll have access to it
    @StateObject private var evm = PurchaseViewModel()
    @StateObject private var loginStatus = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environmentObject(loginStatus)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                PurchaseView()
                    .environmentObject(evm) // pass it into the file you want to access it.
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("Purchase")
                    }
                
                PurchaseStateView()
                    .environmentObject(evm)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("State")
                    }
                
                LoginStatusView()
                    .environmentObject(loginStatus)
                    .tabItem {
                        Image(systemName: "person")
                        Text("User")
                    }
                
                ButtonView()
                    .tabItem {
                        Image(systemName: "button.programmable")
                        Text("Buttons")
                    }
            }
        }
    }
}
