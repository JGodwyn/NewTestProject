//
//  ProgressLoaderView.swift
//  NewTestProject
//
//  Created by Gdwn on 11/10/2024.
//

import SwiftUI

struct ProgressLoaderView: View {
    
    @State private var progressValue1 : Double = 0
    @State private var progressValue2 : Double = 0
    
    var body: some View {
        VStack {
            ProgressView() // typical progress view
            Text("Loading…")
                .padding()
            
            ProgressView("2nd loader") // I can also write like this
                .padding()
            
            ProgressView() {
                Label ("Fetching some content", systemImage: "info.circle.fill")
                    .labelStyle(ChooseColor(text: .black, icon: .gray))
            }
            .tint(Color("AccentColor")) // change the spinner color
            .padding(.vertical, 24)
            
            ProgressView("Applied custom style")
                .progressViewStyle(ProgressViewAccentBg())
            
            ProgressView("3rd loader", value: progressValue1)
                .padding([.horizontal, .bottom], 24)
            
            // I can add my total here
            // by default, the total is 1
            ProgressView("4th loader", value: progressValue2, total: 100)
                .padding([.horizontal, .bottom], 24)
            
            // I can add a custom view
            ProgressView(value: progressValue2, total: 100) {
                Label("Upload progress : \(progressValue2)", systemImage: "square.and.arrow.up.badge.clock.fill")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 8)
            }
            .padding([.horizontal, .bottom], 24)
            
            
            
            // All the buttons are in this stack
            VStack {
                HStack {
                    Button ("Increase 3rd") {
                        withAnimation {
                            progressValue1 += 0.1
                        }
                    }
                    
                    Divider()
                        .frame(height: 24)
                        .padding(.horizontal, 8)
                    
                    Button ("Increase 4th") {
                        withAnimation {
                            if progressValue2 >= 100 {
                                progressValue2 = 0
                            }
                            
                            progressValue2 += 5
                        }
                    }
                }
                
                Button ("Reset all progress") {
                    withAnimation {
                        resetAllProgress()
                    }
                }
                .foregroundColor(.red)
                .padding(.top, 4)
            }
        }
    }
    
    func resetAllProgress() {
        progressValue1 = 0
        progressValue2 = 0
    }
}


#Preview {
    ProgressLoaderView()
}
