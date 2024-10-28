//
//  BgOverlayView.swift
//  NewTestProject
//
//  Created by Gdwn on 28/10/2024.
//

import SwiftUI

// overlays stay at the front of the view
// backgroud go to the back of the view

struct BgOverlayView: View {
    var body: some View {
        VStack (spacing: 16) {
            Text("Using backgrounds and overlays")
                .padding()
                .background(.yellow)
            
            Text("Using backgrounds and overlays")
                .padding()
                .background {
                    // You can add a view to your background
                    Image(systemName: "person")
                        .font(.system(size: 56))
                        .opacity(0.1)
                }
                .clipped() // prevents content from showing beyond the frame
            
            Text("5")
                .foregroundColor(.white)
                .bold()
                .padding()
                .frame(width: 80, height: 80)
                .background (alignment: .center) { // I can also change the alignment
                    // You can add multiple views
                    Circle()
                        .fill(.thinMaterial)
                        .frame(width: 72, height: 72)
                    Image(systemName: "star.fill")
                        .font(.system(size: 48))
                    
                }
                .background(.yellow)
                .clipped()
            
            Image("ProfileSilhoutte")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay (alignment: .bottom){ // align to the bottom
                    Text("Subscribe")
                        .foregroundColor(.white)
                        .fixedSize() // don't break text to new line
                        .bold()
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
        }
        
    }
}

#Preview {
    BgOverlayView()
}
