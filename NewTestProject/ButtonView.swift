//
//  ButtonView.swift
//  NewTestProject
//
//  Created by Gdwn on 14/10/2024.
//

import SwiftUI

struct ButtonView: View {
    
    @EnvironmentObject var router : TabRouter
    @EnvironmentObject var notificationHandler : NotificationModel
    @State private var counter1 : Int = 1
    @State private var counter2 : Int = 2
    
    var body: some View {
        
        ScrollView {
            
            IconLabelButton(btnLabel: "Back home", btnImage: "house") {
                    router.change(to: .one) // change to screen 1
            }
            
            IconLabelButton(btnLabel: "Increase notif", btnImage: "bell.fill") {
                notificationHandler.increaseNotif() // increase notification
            }
            
            IconLabelButton(btnLabel: "Reset notif", btnImage: "bell.slash.fill") {
                notificationHandler.resetNotif() // reset notification
            }
            
            // increase notification via stepper
            Stepper(value: $notificationHandler.notifCount, in: 0...Int.max, step: 1) {
                Text("Change notification")
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(Color("AccentColor"))
            }
            .padding()
            
            VStack(spacing: 32) { // added a spacing across all items
                
                VStack {
                    // 1st button
                    Text("Current number : \(counter1)")
                    Button {
                        //                    counter1 += 1 // better to use a fuction here
                        // I can create and run a func inside here
                        counter1 = extendCounter(value: counter1)
                    } label: {
                        Text("Tap to increase")
                    }
                }
                
                VStack {
                    // 2nd button
                    Text("Cureent number (hardcoded): \(counter2)")
                    Button (action: extendCounterHardcoded) {
                        // action is expecting a func with no parameters
                        // it would throw error if I use smth like extend...()
                        Text("Tap to increase")
                    }
                }
                
                VStack {
                    // 3rd buttons with roles
                    // Roles are more like categories a button can be in.
                    // they're useful for accessibility
                    Text("These buttons have roles").bold()
                    Button(role: .cancel) {
                        // do something
                        // button will appear with default styling
                    } label: {
                        Text("Cancel")
                    }
                    
                    Button("Delete", role: .destructive) {
                        // do something
                        // button will appear red (destructive)
                    }
                    
                    Button("Normal", role: .none) {
                        // do something
                        // normal looking button
                    }
                }
                
                VStack {
                    // 4th button with custom styles
                    // when you're applying custom styles to buttons
                    // and want the whole area to be tapable,
                    // apply the styles to the label text itself, not the button frame
                    Text("These buttons have a custom style")
                    Button {
                        // do something
                    } label: {
                        Text("Tap me") // apply the modifiers here
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .foregroundColor(.white)
                            .background(Color("AccentColor"))
                            .cornerRadius(16)
                    }
                    
                    Button {
                        // do something
                    } label: {
                        Text("Click me") // apply the modifiers here
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .bold()
                            .foregroundColor(.black)
                            .background(Color("Secondary"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        // use clipshape when fixinga corner radius
                    }
                }
                
                VStack {
                    // 5th button with external style declarations
                    Text("Thes styles are applied externally")
                    Button {
                        // this logic is not working
                        extendCounterHardcoded()
                    } label: {
                        Text("Tap to see effect")
                    }
                    .buttonStyle(.send) // check the style doc
                }
                
                // Writing buttons this way isn't efficient,
                // you want to think of 'em as components
                // create them in another file
                
                VStack {
                    PlainButton(btnLabel: "Increase counter") {
                        counter1 = extendCounter(value: counter1)
                        extendCounterHardcoded()
                    }
                    
                    IconLabelButton(btnLabel: "Increase", btnImage: "plus") {
                        extendCounterHardcoded()
                    }
                }
                
                VStack {
                    // Using the material styles
                    // you can apply material to any element though
                    Button {} label: {
                        Text("Click me")
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .bold()
                            .foregroundColor(.black)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    Button {} label: {
                        Text("Click me")
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .bold()
                            .foregroundColor(.black)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    Button {} label: {
                        Text("Click me")
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .bold()
                            .foregroundColor(.black)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    Button {} label: {
                        Text("Click me")
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .bold()
                            .foregroundColor(.black)
                            .background(.thickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    Button {} label: {
                        Text("Click me")
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .bold()
                            .foregroundColor(.red)
                            .background(.ultraThickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .frame(alignment: .topLeading)
                .padding()
                .background(.blue)
            }
            .padding()
        }
    }
}

#Preview {
    ButtonView()
        .environmentObject(TabRouter())
        .environmentObject(NotificationModel())
}


private extension ButtonView {
    func extendCounter (value: Int) -> Int { // this is kinda weird lol
        var newItem = value
        newItem += 1
        return newItem
    }
    
    func extendCounterHardcoded () {
        counter2 += 1
    }
}

