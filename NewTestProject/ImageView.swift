//
//  ImageView.swift
//  NewTestProject
//
//  Created by Gdwn on 01/10/2024.
//

import SwiftUI

struct ImageView: View  {
    var body: some View {
        Image("face-with-monocle") // this is how you use an image
            .resizable() // won't resize until you specify this
            .frame(width: 100, height: 100)
        
        // the images below were grouped in a folder
        // yet I don't need to specify the path
        Image("ProfileSilhoutte")
            .resizable()
            .frame(width: 100, height: 100)
        
        Image("ProfileImage")
            .resizable()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ImageView()
}
