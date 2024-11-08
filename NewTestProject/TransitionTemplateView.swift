//
//  TransitionView.swift
//  NewTestProject
//
//  Created by Gdwn on 08/11/2024.
//

import SwiftUI

// transition affects things going out and coming in

struct TransitionTemplateView: View {
    
    @State private var isVisible : Bool = false
    var btnName : String
    var transitionType : AnyTransition
    var animationType : Animation = .linear(duration: 0.25)
    
    var body: some View {
        VStack {
            
            if isVisible {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.mint)
                    .frame(width: 100, height: 100)
                    .transition(transitionType) // how do you want it to change?
            }
            
            MainButton(label: btnName) {
                withAnimation (animationType) {
                    isVisible.toggle()
                }
            }
        }
        .padding()
    }
}

#Preview {
    TransitionTemplateView(btnName: "Toggle", transitionType: .opacity)
}
