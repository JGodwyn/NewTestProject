//
//  TextView.swift
//  NewTestProject
//
//  Created by Gdwn on 26/10/2024.
//

import SwiftUI

struct TextView: View {
    
    var body: some View {
        // check the apple documentation for the different text modifiers there are
        Text("Hello, World!")
            .bold()
            .italic()
            .underline(color: .red)
        
        Text("Large title")
            .foregroundColor(.mint)
            .font(.largeTitle.weight(.black))
        
        Text("System styled")
            .foregroundColor(.blue)
            .font(.system(size: 24, weight: .bold, design: .serif))
        
        Text(.now, style: .timer) // adds a timer (I can't observe it for changes though)
        
        // using the format keyword
        Text(Date.now, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
        
        // you can also use the format in other ways
        // it doesn't just apply to dates
        Text(72.3, format: .currency(code: "GBP"))
        Text(72.3, format: .currency(code: "USD"))
        
        Text(Date.now ... Date.now.addingTimeInterval(1000))
        
        // adding a SF symbol directly into text
        // this works because an SF sysmbol is essentialy a text
        Text("View calendar \(Image(systemName: "calendar")) here")
        
        
    }
}

#Preview {
    TextView()
}
