//
//  LoginStatusView.swift
//  NewTestProject
//
//  Created by Gdwn on 07/10/2024.
//

import SwiftUI

struct LoginStatusView: View {
    
    @EnvironmentObject var loginVm : LoginViewModel
    
    var body: some View {
        
        VStack {
            if loginVm.isLoggedIn {
                Image("ProfileSilhoutte")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } else {
                Image(systemName: "person")
                    .font(.system(size: 56))
                    .symbolVariant(.fill)
            }
            
            HStack {
                Circle()
                    .fill(loginVm.isLoggedIn ? Color.green : Color.gray)
                    .frame(width: 10, height: 10)
                Text("Logged \(loginVm.isLoggedIn ? "in" : "out")")
            }
            .padding()
        }
    }
}

#Preview {
    LoginStatusView()
        .environmentObject(LoginViewModel())
}
