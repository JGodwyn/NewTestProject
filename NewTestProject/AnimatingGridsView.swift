//
//  AnimatingGridsView.swift
//  NewTestProject
//
//  Created by Gdwn on 06/11/2024.
//

import SwiftUI

struct AnimatingGridsView: View {
    
    @State private var isMultiColumn : Bool = false
    
    private var GridColumm : [GridItem] {
        // using a computed property to get the value of GridColumn
        
        // repeating x value (repeating), how many times (count)
        Array(repeating: GridItem(.flexible()), count: isMultiColumn ? 1 : 2)
        
        // this is longer
//        if (isMultiColumn) {
//            return [ GridItem(.flexible()) ]
//        } else {
//            return [
//                GridItem(.flexible()),
//                GridItem(.flexible()),
//            ]
//        }
    }
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            MainButton(label: "Change view", icon: isMultiColumn ? "rectangle.grid.1x2.fill" : "rectangle.grid.2x2.fill") { isMultiColumn.toggle() }
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            LazyVGrid (columns : GridColumm) {
                ForEach (1...50, id: \.self) {
                    item in
                    Text("")
                        .frame(maxWidth: .infinity)
                        .frame(height: isMultiColumn ? 160 : 100)
                        .background(.blue)
                }
            }
            .animation(.spring(), value: isMultiColumn)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AnimatingGridsView()
}
