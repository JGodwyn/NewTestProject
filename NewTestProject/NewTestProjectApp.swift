//
//  NewTestProjectApp.swift
//  NewTestProject
//
//  Created by Gdwn on 01/10/2024.
//

import SwiftUI

@main
struct NewTestProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PurchaseView()
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("Purchase")
                    }
                
                PurchaseStateView()
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
