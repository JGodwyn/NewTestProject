//
//  BindingView.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import SwiftUI

struct BindingView: View {
    
    @State private var isLoading = false
    @State private var isLoading2 = true
    
    var body: some View {
        VStack {
            // using the view from this file below
            innerLoadingView(isLoading: $isLoading)
            
            // this is from an external file. I don't need to specify the path (wild!)
            // just call it and it works
            OuterLoadingView(isLoadingOuter: $isLoading)
            OuterLoadingView(isLoadingOuter: $isLoading2)
            
            Button("\(isLoading ? "Stop" : "Start") loading") {
                withAnimation {
                    isLoading.toggle()
                    isLoading2.toggle()
                }
            }
        }
    }
}

// this view with a binding is placed internally
// I placed another (outerLoadingView) externally
struct innerLoadingView : View {
    @Binding var isLoading : Bool
    
    var body : some View {
        if isLoading {
            ProgressView()
        } else {
            Text("Finished loading")
        }
    }
}

#Preview {
    BindingView()
}
