//
//  ProgressViewStyles.swift
//  NewTestProject
//
//  Created by Gdwn on 11/10/2024.
//

import Foundation
import SwiftUI


struct ProgressViewAccentBg : ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView() {
            configuration.label // change the label design
                .foregroundColor(.white)
                .bold()
            
            configuration.currentValueLabel
                .foregroundColor(.red)
        }
            .tint(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color("AccentColor"))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


