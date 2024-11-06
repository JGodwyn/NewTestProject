//
//  NewTestProjectApp.swift
//  NewTestProject
//
//  Created by Gdwn on 01/10/2024.
//

import SwiftUI


// class to switch tabs without tapping on them
final class TabRouter : ObservableObject {
    @Published var screen : Screen = .one
    
    enum Screen {
        case one
        case two
        case three
        case four
        case five
    }
    
    func change(to screen: Screen) {
        self.screen = screen
    }
}

@main
struct NewTestProjectApp: App {
    
    // define it as usual
    // but since it is declared at the root of your app
    // you can inject it to any scrren and they'll have access to it
    @StateObject private var evm = PurchaseViewModel()
    @StateObject private var loginStatus = LoginViewModel()
    
    // using the class defined above
    // this state object handles the change between screens
    @StateObject private var router = TabRouter()
    
    // add and remove notifications
    @StateObject private var notificationHandler = NotificationModel()
    
    // NOTE: If you tag some tabs and not others, weird things might happen
    // it's a good idea to tag all your screens.
    
    
    var body: some Scene {
        WindowGroup {
            TabView (selection: $router.screen) { // whenever router.screen changes, check and change the selection to match the changes
                ContentView()
                    .environmentObject(loginStatus)
                    .environmentObject(router)
                    .environmentObject(notificationHandler)
                    .tag(TabRouter.Screen.one) // give this screen an identifier so the selection know what to change to (in this case, change here when it is Screen 1)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                //                PurchaseView()
                //                    .environmentObject(evm) // pass it into the file you want to access it.
                //                    .tabItem {
                //                        Image(systemName: "creditcard")
                //                        Text("Purchase")
                //                    }
                //
                //                PurchaseStateView()
                //                    .environmentObject(evm)
                //                    .tabItem {
                //                        Image(systemName: "gear")
                //                        Text("State")
                //                    }
                
                
                // You can also write tab items like this.
                ButtonView()
                    .environmentObject(router)
                    .environmentObject(notificationHandler)
                    .badge(notificationHandler.notifCount) // adding a badge
                    .tag(TabRouter.Screen.two)
                    .tabItem {
                        Label("Buttons", systemImage: "button.programmable")
                    }
                
                TextfieldView()
                    .tag(TabRouter.Screen.three)
                    .tabItem {
                        Image(systemName: "textformat")
                        Text("Login")
                    }
                
                LoginStatusView()
                    .tag(TabRouter.Screen.four)
                    .environmentObject(loginStatus)
                    .tabItem {
                        Image(systemName: "person")
                        Text("User")
                    }
                
                GridView()
                    .tag(TabRouter.Screen.five)
                    .tabItem {
                        Label("Grid", systemImage: "grid.circle.fill")
                    }
            }
        }
    }
}
