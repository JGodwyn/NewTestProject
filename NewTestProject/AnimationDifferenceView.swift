//
//  AnimationDifferenceView.swift
//  NewTestProject
//
//  Created by Gdwn on 08/11/2024.
//

import SwiftUI

// cubic-bezier.com is a site you can see the curves for different animations
// super helpful when you want to create custom animations using their values

struct EveryAnimation : Identifiable {
    let id = UUID()
    var animationType : Animation
    var description : String
    
    static let examples : [EveryAnimation] = [
        EveryAnimation(animationType: .linear(duration: 1), description: "Linear"),
        .init(animationType: .easeIn(duration: 1), description: "Ease In"), // you can also write this way
        EveryAnimation(animationType: .easeOut(duration: 1), description: "Ease Out"),
        EveryAnimation(animationType: .easeInOut(duration: 1), description: "Ease In Out"),
        // setting a custom animation option
        .init(animationType: .timingCurve(0, 0.5, 1, 0.6, duration: 1), description: "Custom")
    ]
}

struct AnimationDifferenceView: View {
    
    private let newGrid : GridItem = GridItem(.flexible(minimum: 20))
    
    var body: some View {
        LazyVGrid (columns : Array(repeating: newGrid, count: 2), spacing: 32) {
            ForEach (EveryAnimation.examples) {
                item in
                RotatingSync(animationStuff: item)
            }
        }
    }
}

#Preview {
    AnimationDifferenceView()
}
