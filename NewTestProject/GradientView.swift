//
//  GradientView.swift
//  NewTestProject
//
//  Created by Gdwn on 03/10/2024.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        VStack {
            ZStack {
                // how to use Gradients
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color("Secondary")]),
                    startPoint: .top,
                    endPoint: .bottom) // for vertical gradients
                
                // masking the radial gradient in a symbol
//                RadialGradient(
//                    colors: [Color("Secondary"), Color.blue],
//                    center: .center,
//                    startRadius: 10,
//                    endRadius: 15)
//                    .mask {
//                        Image(systemName: "arrow.down")
//                            .font(.system(size: 64, weight: .bold))
//                }
                
                // masking the radial gradient in an image
//                RadialGradient(
//                    colors: [Color("Secondary"), Color.blue],
//                    center: .center,
//                    startRadius: 10,
//                    endRadius: 15)
//                .mask {
//                    Image("ProfileSilhoutte")
//                        .resizable()
//                        .frame(width: 100, height: 101)
//                }
                
                // masking the linear gradient in a symbol
                LinearGradient(
                    gradient: Gradient(colors: [Color("AccentColor"), Color("Secondary")]),
                    startPoint: .bottom,
                    endPoint: .top) // for vertical gradients
                .mask {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 40, weight: .bold))
                }
            }
            
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color("AccentColor")]),
                    startPoint: .leading,
                    endPoint: .trailing) // for horizontal gradients
                
                Text("Hello world")
                    .foregroundColor(Color.white)
            }
            
            ZStack {
                LinearGradient( // specifying how far the gradient should go
                    stops: ([.init(color: Color.white, location: 0), .init(color: Color("Secondary"), location: 1)]),
                    startPoint: .top,
                    endPoint: .bottom)
                
                RadialGradient(
                    colors: [Color("Secondary"), Color.blue],
                    center: .center,
                    startRadius: 30,
                    endRadius: 40)
                    .mask { // masking the gradient in a text
                        Text("Hello World")
    //                        .bold()
                            .font(.system(size: 32, weight: .bold))
                }
                
            }
            
            ZStack {
                RadialGradient(
                    colors: [Color.white, Color.blue, Color("Secondary")],
                    center: .center,
                    startRadius: 50,
                    endRadius: 100)
                
                Text("Hello") // applying gradient to a text
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white, Color("AccentColor")]),
                            startPoint: .leading,
                            endPoint: .trailing))
            }
            
        }.ignoresSafeArea()
    }
}

#Preview {
    GradientView()
}
