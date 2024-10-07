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
    
    var body: some Scene {
        WindowGroup {
            TabView {
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
                
                ContentView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Content")
                    }
            }
        }
    }
}
