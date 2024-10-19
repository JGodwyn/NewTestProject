//
//  DateView.swift
//  NewTestProject
//
//  Created by Gdwn on 19/10/2024.
//

import SwiftUI

struct DateView: View {
    
    @State private var selectedDate : Date = .now
    
    // you are creating a value
    // whose content is gotten by running the func
    // the () at the end means you run the func immediately
    private let dateRange : ClosedRange<Date> = {
        
        let calendar = Calendar.current
        // I had to unwrap the following values with a !
        let minAgeDate = calendar.date(byAdding: .year, value: -120, to: .now)!
        let maxAgeDate = calendar.date(byAdding: .year, value: -20, to: .now)!
        
        // this is returning a date range
        // betweeen 120 years ago and 20 years ago
        return minAgeDate...maxAgeDate
        
    }()
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 24) {
                Text(selectedDate, style: .date) // show the date
                    .padding()
                
                DatePicker("Start Date",
                           selection: $selectedDate, // bind the date selection to this value
                           displayedComponents: [.date, .hourAndMinute]) // show the date, hour and minute
                
                // hiding the label
                DatePicker("Start Date",
                           selection: $selectedDate,
                           displayedComponents: .date)
                .labelsHidden() // hide the label
                
                // adding a custom view
                DatePicker(selection: $selectedDate, displayedComponents: .date) {
                    // I can edit the text
                    Text("Choose a date")
                }
                
                // adding a custom view
                DatePicker(selection: $selectedDate, displayedComponents: .date) {
                    // I can edit the text
                    Label("Choose a date", systemImage: "calendar")
                }
                
                // setting a max range
                DatePicker(selection: $selectedDate, in: dateRange, displayedComponents: .date) {
                    Text("Select a date within a range")
                }
                
                // change the view of the datepicker
                DatePicker(selection: $selectedDate, in: dateRange, displayedComponents: .date) {
                    Text("Select a date within a range")
                }
                .labelsHidden()
                .datePickerStyle(.wheel)
                
                // change the view of the datepicker
                DatePicker(selection: $selectedDate, in: dateRange, displayedComponents: .date) {
                    Text("Select a date within a range")
                }
                .labelsHidden()
                .datePickerStyle(.graphical)
            }
            .padding()
        }
        
    }
}

#Preview {
    DateView()
}
