//
//  TransitionView.swift
//  NewTestProject
//
//  Created by Gdwn on 08/11/2024.
//

import SwiftUI


struct TransitionView: View {
    
//    // you can also combine transitions this way—
//    static let slideScaleOpacity : AnyTransition = AnyTransition.slide
//        .combined(with: .opacity)
//        .combined(with: .scale(scale: 0))
//    
//    // setting an asymmetric style lets you decide how it should come in and go out
//    let asymmetricTransition : AnyTransition = AnyTransition
//        .asymmetric(insertion: TransitionView.slideScaleOpacity, // how should it come in
//                    removal: .move(edge: .bottom)) // how should it leave
    
    var body: some View {
        LazyVGrid (columns : Array(repeating: GridItem(.flexible(minimum: 160)), count: 2)) {
            Group {
                TransitionTemplateView(btnName: "Opacity", transitionType: .opacity)
                TransitionTemplateView(btnName: "From Top", transitionType: .move(edge: .top)) // comes from the top, leaves from the same direction
                TransitionTemplateView(btnName: "From bottom", transitionType: .move(edge: .bottom))
                TransitionTemplateView(btnName: "From leading", transitionType: .move(edge: .leading))
                TransitionTemplateView(btnName: "From trailing", transitionType: .move(edge: .trailing))
                TransitionTemplateView(btnName: "Toggle", transitionType: .slide) // comes from the right, leaves from the left
                TransitionTemplateView(btnName: "Scale spring", transitionType: .scale, animationType: .spring) // increases as it show, decreases as it leaves
                TransitionTemplateView(btnName: "Scale 50%", transitionType: .scale(scale: 0.5)) // increase from 50% and decrease to 50% and dissappear
                TransitionTemplateView(btnName: "50% top-left", transitionType: .scale(scale: 0.5, anchor: .topLeading))
            }
            
            Group {
                // combining animations
                let slideScaleOpacity : AnyTransition = AnyTransition.slide
                    .combined(with: .opacity)
                    .combined(with: .scale(scale: 0))
                
                // setting a different style for coming in and going out
                let asymmetricTransition : AnyTransition = AnyTransition
                    .asymmetric(insertion: slideScaleOpacity, // how should it come in
                                removal: .move(edge: .bottom)) // how should it leave
                
                TransitionTemplateView(btnName: "SlideScaleOpacity", transitionType: slideScaleOpacity)
                TransitionTemplateView(btnName: "Asymmetric", transitionType: asymmetricTransition)
            }
        }
    }
}

#Preview {
    TransitionView()
}
