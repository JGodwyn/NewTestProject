//
//  StepperView.swift
//  NewTestProject
//
//  Created by Gdwn on 12/10/2024.
//

import SwiftUI

struct StepperView: View {
    
    @State private var count1 : Int = 1
    @State private var count2 : Int = 0
    @State private var isCounting2 : Bool = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text("\(count1)")
                    .font(.system(size: 43))
                    .bold()
                Image(systemName: "birthday.cake.fill")
                    .font(.system(size: 27))
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color("Surface1"))
            .cornerRadius(24)
            
            // adding a custom view to my stepper
            Stepper(value: $count1, in: 0...20, step: 1) {
                //                Spacer()
                Label("How many cake do you want?", systemImage: "birthday.cake.fill")
            }
            .padding()
            
            Stepper("Quantity", value: $count1, in: 0...20, step: 1)
            
            Stepper("Quantity", value: $count1, in: 0...20, step: 1)
                .labelsHidden() // hiding the label
            
            Stepper(value: $count1, in: 0...20, step: 1) {
                Text("Increase your options")
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(Color("AccentColor"))
            }
            
            // Latest stepper
            VStack {
                Text("Your current count is: \(count2)")
                    .font(.system(size: 20))
                    .bold()
                Stepper (value: $count2, in: 0...10, step: 1) {
                    Text("Increase your count")
                } onEditingChanged: { isCounting in
                    isCounting2 = isCounting
                }
                // onEditingChanged handles whether the stepper is actively clicked or not
                
                
                // showing the update when you pressed the stepper
                HStack {
                    Image("face-with-monocle")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("You're pressing the stepper")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(.green)
                .cornerRadius(16)
                .offset(x: 0, y: -530)
                .opacity(isCounting2 ? 1 : 0)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    StepperView()
}
