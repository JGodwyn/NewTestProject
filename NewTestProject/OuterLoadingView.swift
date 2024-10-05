//
//  OuterLoadingView.swift
//  NewTestProject
//
//  Created by Gdwn on 05/10/2024.
//

import SwiftUI

struct OuterLoadingView: View {
    
    @Binding var isLoadingOuter : Bool
    
    var body: some View {
        if isLoadingOuter {
            ProgressView()
        } else {
            Text("Finished loading")
        }
    }
}

// to show multiple views
struct OuterLoadingView_Previews : PreviewProvider {
    static var previews: some View {
        OuterLoadingView(isLoadingOuter: .constant(false))
        OuterLoadingView(isLoadingOuter: .constant(true))
    }
}

//#Preview {
//    Group {
//        OuterLoadingView(isLoadingOuter: .constant(false))
//        OuterLoadingView(isLoadingOuter: .constant(true))
//    }
//}
