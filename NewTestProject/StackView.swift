//
//  StackView.swift
//  NewTestProject
//
//  Created by Gdwn on 01/11/2024.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        
        /* At this time, you can only specify 10 static element inside a stack
         Going more than this will throw an error. Eg. Using Text("Hey") 10 times
         inside a VStack, HStack, or ZStack will throw an error.
         You can work around this by grouping them though. But you'd almost never
         run into this issue
         */
        ScrollView (showsIndicators : false) {
            LazyVStackSectionExample
            LazyVStackSectionExample
            ZStackExample
            LazyVStackExample
        }
        .padding()
        .ignoresSafeArea(edges: .bottom) // ignore bottom safearea
    }
}

#Preview {
    StackView()
}


private extension StackView {
    
    var ZStackExample : some View {
        ZStack {
            Image(systemName: "star")
                .resizable()
                .symbolVariant(.fill)
                .foregroundColor(.yellow)
                .frame(width: 200, height: 200)
                .scaledToFit() // scale to fit the width (won't work cos of the frame)
            Text("Hello world")
                .zIndex(-1) // push it behind the ZStack
                .fixedSize() // always hug content
        }
    }
    
    // everything that works for VStacks also work for HStacks
    
    var LazyVStackExample : some View {
        // you use lazy VStacks when the content is huge
        // eg. when you have 100,000 lists on the screen
        // that will eat up your memory.
        
        // as the name implies, it only creates the view when it is on the screen
        // so, it kinda delays on creating the view until it is needed
        // some on-demand stuff
        
        LazyVStack (alignment: .leading, spacing: 8) { // works same way as a VStack
            ForEach(0...100000, id: \.self) { item in
                Text("\(item)")
            }
        }
    }
    
    var LazyVStackSectionExample : some View {
        
        LazyVStack (alignment : .leading, pinnedViews: .sectionHeaders) {
            
            // also has pinned views for pinning section headers and footers
            // LazyVStack (alignment : .leading, pinnedViews: [.sectionHeaders, .sectionFooters])
            
            Section {
                // section lets you group views into sections
                // with header and/or footers
                ForEach (0...32, id: \.self) { item in
                    Text("\(item)")
                        .padding(.bottom, 8)
                }
            } header: {
                Text("Header")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.yellow)
            } footer: {
                Text("This is a footer")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.mint)
            }
        }
    }
}
