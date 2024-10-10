//
//  LoginBindView.swift
//  NewTestProject
//
//  Created by Gdwn on 08/10/2024.
//

import SwiftUI


// this view will act as a component you can
// add to other screens
// it's just a way for me to understand Binding completely

struct LoginBindView: View {
    
    @Binding var isLogic : Bool
    
    var body: some View {
        VStack {
            if isLogic {
                Image("ProfileSilhoutte")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person")
                    .symbolVariant(.fill)
                    .font(.system(size: 56))
            }
            
            HStack {
                Circle()
                    .fill(isLogic ? Color.green : Color.gray)
                    .frame(width: 10)
                Text("Logged \(isLogic ? "In" : "Out")")
            }
            .padding()
        }
    }
}

#Preview {
    LoginBindView(isLogic: .constant(false))
}
