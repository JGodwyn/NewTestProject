//
//  GroupboxStyle.swift
//  NewTestProject
//
//  Created by Gdwn on 26/10/2024.
//

import Foundation
import SwiftUI

struct GroupboxVerticalStyle : GroupBoxStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        VStack (alignment: .leading) {
            configuration.label
                .bold()
                .padding(.bottom, 8)
            configuration.content
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity, minHeight: 48)
        .padding()
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
}
