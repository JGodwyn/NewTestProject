//
//  SafeAreaView.swift
//  NewTestProject
//
//  Created by Gdwn on 28/10/2024.
//

import SwiftUI

struct SafeAreaView: View {
    
    @State private var showSidebar : Bool = false
    private var gradientColors : [Color] = [ .red, .blue ]
    private var listArray : ClosedRange<Int> = 1...32
    
    var body: some View {
        ZStack {
            backgroundVw
            
            ScrollView {
                Text("Outside the stack")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 24))
                
                TextField("Search stack", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                
                VStack {
                    ForEach(listArray, id: \.self) { item in
                        Text("\(item)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
            .padding()
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .safeAreaInset(edge: .leading,
                       alignment: .top) {
            // adds a sidebar
            if showSidebar {
                sideBarVw
            }
        }
       .safeAreaInset(edge: .bottom, alignment: .trailing) {
           MainButton(label: "Sidebar", icon: showSidebar ? "eye.slash" : "eye") {
               withAnimation {
                   showSidebar.toggle()
               }
           }
           .padding(.trailing, 16)
       }
    }
}

#Preview {
    SafeAreaView()
    //    NumberListView()
}


private extension SafeAreaView {
    
    var backgroundVw : some View {
        // I specifically set that only the gradient should ignore safe area
        LinearGradient( colors: gradientColors, startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.container, edges: .all)
        // .ignoresSafeArea(.keyboard, edges: .all) // ignores the keyboard
        // .container means you should respect the safe areas defined by the immediate parent container
        // I can use multiple edges when defining the safe areas
        // something like this "edge: [.bottom, .top]
    }
    
    var sideBarVw : some View {
        // add a sidebar to the left
        ScrollView {
            VStack {
                ForEach(["Home", "Features", "Profile", "Settings"], id: \.self) {
                    item in
                    Text("\(item)")
                        .foregroundColor(.white)
                        .bold()
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .frame(width: 200)
        .background(.ultraThinMaterial)
    }
    
}


struct NumberListView : View {
    
    var body: some View {
        
        NavigationView {
            List(0..<20) { i in
                Text("Number \(i)")
            }
            .navigationTitle("Numbers")
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: 200) {
                // spacing increases the space between the container and the view in the inset
                // adding a floating button
                Button {
                    // do something
                } label: {
                    Image(systemName: "plus")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                }
                .padding(.trailing, 24)
            }
            
        }
    }
    
}
