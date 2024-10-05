//
//  LayoutView.swift
//  NewTestProject
//
//  Created by Gdwn on 04/10/2024.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        VStack {
            Text("Fixed width & height")
                .foregroundColor(Color.white)
                .frame(width: 200, height: 120, alignment: .topLeading)
                .background(Color("AccentColor"))
            
            Text("Max width and height that will break into a new line when maxWidth is reached")
                .padding() // padding will be applied inside the frame not around it
                .frame(minWidth: 80, maxWidth: 180, alignment: .topLeading)
                .background(Color("Secondary"))
            
            // this is essentially "fill container"
            Text("Infinite width and height text")
                .foregroundColor(Color.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity )
                .background(Color.blue)
                .clipped() // clips the view to its frame
            
            Image("ProfileSilhoutte")
                .resizable()
                .frame(width: 70, height: 70)
//                .clipShape(Circle()) // you can also use clip shape for masking
                .mask { Circle() }
                .overlay {
                    Text("10+")
                        .foregroundColor(Color.black)
                        .font(.system(size: 17, weight: .bold))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color("Secondary"))
                        .clipShape(Capsule())
                        .offset(x:24, y:24)
                        .frame(maxWidth: 200, maxHeight: 20) // you can add a frame here
                }
        }
    }
}

#Preview {
    LayoutView()
}
