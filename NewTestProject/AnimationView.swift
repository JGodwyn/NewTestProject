//
//  AnimationView.swift
//  NewTestProject
//
//  Created by Gdwn on 06/11/2024.
//

import SwiftUI

// cubic-bezier.com is a site you can see the curves for different animations
// super helpful when you want to create custom animations using their values

struct AnimationView: View {
    
    @State private var isGreen : Bool = false
    @State private var isMinimized : Bool = false
    @State private var isRotating : Bool = false
    
    // I am using a computed property for the animation
    private var animationEffect : Animation {
        .linear(duration: 1) // how long it takes
        .repeatForever(autoreverses: false) // repeat forever without reversing
    }
    
    var body: some View {
        ScrollView {
            //            withAnimationExamples
            justAnimationExamples
        }
        .padding()
    }
}

#Preview {
    //    AnimationView()
    RotatingSync(animationStuff: .examples.first!) // get the first item in example
}

private extension AnimationView {
    
    var withAnimationExamples : some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(isGreen ? .green : .red)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .scaleEffect(isMinimized ? 0.5 : 1)
            
            MainButton(label: isGreen ? "Turn Red" : "Turn Green") {
                withAnimation (.easeOut) {
                    isGreen.toggle()
                }
            }
            
            MainButton(label : "Minimize") {
                withAnimation (.spring.delay(0.25).speed(1.5)) { // add a delay and speed
                    isMinimized.toggle()
                }
            }
        }
    }
    
    var justAnimationExamples : some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(isGreen ? .green : .red)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .scaleEffect(isMinimized ? 0.5 : 1)
                .animation(.easeInOut, value: [isGreen, isMinimized]) // you can write this way
                .animation(.spring, value: isMinimized) // or this way
            
            MainButton(label: isGreen ? "Turn Red" : "Turn Green") {
                isGreen.toggle()
            }
            
            MainButton(label : "Minimize") {
                isMinimized.toggle()
            }
        }
    }
}


struct RotatingSync : View {
    
    @State private var isRotating : Bool = false
//    let animationCurve : Animation
//    let animationName : String
    
    let animationStuff : EveryAnimation
    
    private var animationEffect : Animation {
        //        .linear(duration: 1) // how long it takes
        animationStuff.animationType
            .repeatForever(autoreverses: false) // repeat forever without reversing
    }
    
    var body : some View {
        VStack {
            Image(systemName: "arrow.2.circlepath")
                .symbolVariant(.circle.fill)
                .font(.system(size: 56))
                .foregroundColor(Color("AccentColor"))
                .rotationEffect(.init(degrees: isRotating ? 360 : 0))
                .animation(animationEffect, value: isRotating)
            
            Text(animationStuff.description)
                .bold()
                .padding(.top, 4)
            
        }
        .onAppear() {
            isRotating = true
        }
    }
    
}
