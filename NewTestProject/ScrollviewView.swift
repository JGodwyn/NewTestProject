//
//  ScrollviewView.swift
//  NewTestProject
//
//  Created by Gdwn on 31/10/2024.
//

import SwiftUI

struct ScrollviewView: View {
    
    @State private var hasReachedEnd : Bool = false
    private let numberRange : ClosedRange<Int> = 0...24
    
    var body: some View {
        ScrollView(showsIndicators : false) { // hide the scrollbar
            
            ScrollViewReader { scrollPosition in // you need this to control the scrollview
                
                // horizontal scrollview
                ScrollView (.horizontal, showsIndicators: false) { // horizontal scroll
                    
                    VStack (alignment : hasReachedEnd ? .trailing : .leading) {
                        HStack {
                            ForEach(numberRange, id: \.self) { item in
                                createVw(with: item)
                            }
                            
                        }
                        
                        HStack { // horizontal buttons
                            MainButton(label: "Top", fillContainer: true) {
                                withAnimation {
//                                    scrollPosition.scrollTo(numberRange.lowerBound)
                                    if let firstIndex = numberRange.min() {
                                        // this is the way he did it in the class
                                        // this is better when you're not sure of the max
                                        // if the max is nil, this code will not run
                                        // but it will throw an error in the one above
                                        // it just depends on whether you're sure one is
                                        // returning a value or not.
                                        scrollPosition.scrollTo(firstIndex)
                                    }
                                }
                                hasReachedEnd = false
                            }
                            
                            MainButton(label: "bottom", fillContainer: true) {
                                withAnimation {
//                                    scrollPosition.scrollTo(numberRange.upperBound)
                                    if let lastIndex = numberRange.max() {
                                        scrollPosition.scrollTo(lastIndex)
                                    }
                                }
                                hasReachedEnd = true
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
            
            // vertical scrollview
            VStack {
                ForEach(0...20, id: \.self) { item in
                    createVw(with: item)
                }
            }
        }
        .padding(24)
    }
}

#Preview {
    ScrollviewView()
}

private extension ScrollviewView {
    
    // you're calling a func that is returning a view. Makes sense
    func createVw (with index : Int) -> some View {
        Text("\(index)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}
