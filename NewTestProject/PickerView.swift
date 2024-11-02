//
//  PickerView.swift
//  NewTestProject
//
//  Created by Gdwn on 02/11/2024.
//

import SwiftUI

struct PickerView: View {
    
    @State private var selectedName : String = ""
    var allNames : [String] = [
        "John",
        "Godwin",
        "Jonah",
        "Virgil",
        "Jackson"
    ]
    
    var body: some View {
        
        //        PickerDiffList
        
        ScrollView {
            Text("Selected name: \(selectedName)")
                .bold()
            
            FirstPicker
            SecondPicker
            PickerWithStyles
        }
        .onAppear { // when the VStack appears
            // this is how you set a default value for the picker
            // the ?? is used on optionals
            // this means if allNames is nil, set the value to ""
            // else set it to allNames.
            selectedName = allNames.first ?? ""
        }
    }
}

#Preview {
    //    PickerView()
    //    FlavourView() // using identifiable structs
    AnimesView() // using enums
}


private extension PickerView {
    
    var FirstPicker  : some View {
        Picker("Choose a name", selection: $selectedName) { // I don't see the "choose a name"
            // everything you enter here becomes an option on the picker
            // each item must be uniquely identified
            Text("Name")
                .tag("name")
            Text("Number")
                .tag("number")
            Text("Digit")
                .tag("digit")
            Spacer()
                .tag("spacer")
        }
    }
    
    var SecondPicker : some View {
        Picker("Choose a name", selection: $selectedName) {
            // I can also use a loop
            ForEach (allNames, id: \.self) {
                item in
                Text("\(item)")
            }
        }
    }
    
    var PickerWithStyles : some View {
        VStack {
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.menu)
            
            // segmented bar
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.segmented)
            
            // inline (looks the same as wheel)
            // the difference is very apparent within a list
            // better for using within other controls (inline)
            // fits better within other controls
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.inline)
            
            // wheel (seems to be the same as inline though)
            // better for more options
            // use when you want to add a lot of options
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.wheel)
        }
    }
    
    var PickerDiffList : some View {
        List {
            // using picker within lists to show the difference
            // you can see that title shows this time
            
            // segmented bar
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.segmented)
            
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.menu)
            
            // inline (looks the same as wheel)
            // the difference is very apparent within a list
            // better for using within other controls (inline)
            // fits better within other controls
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.inline)
            
            // wheel (seems to be the same as inline though)
            // better for more options
            // use when you want to add a lot of options
            Picker ("Choose a style", selection: $selectedName) {
                ForEach (allNames, id: \.self) {
                    item in
                    Text("\(item)")
                }
            }
            .pickerStyle(.wheel)
            
        }
    }
}




// Another example
// using Identifiable structs
struct FlavourView : View {
    
    @State private var selectedFlavour : Flavours = .none // assign it to the static property
    
    private var allTheFlavours : [Flavours] = [
        Flavours(name: "Strawberry", price: 200),
        Flavours(name: "Vanilla", price: 150),
        Flavours(name: "Chocolate", price: 300),
        Flavours(name: "Plain", price: 100)
        
    ]
    
    var body : some View {
        VStack {
            Text("Selected Flavour : \(selectedFlavour.name)")
                .bold()
            Picker("Flavour types", selection: $selectedFlavour) {
                ForEach (allTheFlavours) {
                    item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.price, format: .currency(code: "GBP"))
                    }
                    .tag(item)
                    // must conform to hashable to use the tag since you can't use ID in the ForEach constructor
                }
            }
            .pickerStyle(.wheel)
            .padding(.horizontal, 24)
        }
    }
}

struct Flavours : Identifiable, Hashable {
    // uniquely identify each item
    let id = UUID()
    let name : String
    let price : Decimal
    
    static let none : Flavours = Flavours(name: "", price: 0)
}



// another example
// using enums
struct AnimesView : View {
    @State private var selectedAnime : allAnimes = .allCases.first! // select the first item
    
    var body : some View {
        Text("Selected anime: " + selectedAnime.title) // access the title in the first item
            .bold()
        Picker("Choose an item", selection: $selectedAnime) {
            ForEach(allAnimes.allCases) { // iterate through all cases in the enum
                item in
                Text(item.title)
                    .tag(item)
            }
        }
        .pickerStyle(.wheel)
    }
    
}

enum allAnimes : CaseIterable, Identifiable, Hashable {
    
    var id: Self {self} // so it conforms with Identifiable
    
    case attackOnTitan
    case vinlandSaga
    case dandandan
    case soloLeveling
    
    
    var title : String {
        switch self { // go through yourself
        case .attackOnTitan:
            return "Attack on Titan"
        case .vinlandSaga:
            return "Vinland Saga"
        case .dandandan:
            return "Dan Dan Dan"
        case .soloLeveling:
            return "Solo Leveling"
        }
    }
    
}
