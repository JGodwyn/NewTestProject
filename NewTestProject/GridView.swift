//
//  GridView.swift
//  NewTestProject
//
//  Created by Gdwn on 04/11/2024.
//

import SwiftUI


struct allItemsMain : Identifiable {
    let id = UUID()
    let newItem : String
    
//    static let testItemsMain : [String] = (1...24).map { "Test \($0)"}

    static var someItems : [allItemsMain] = (1...24).map {
        allItemsMain(newItem: "item \($0)")
    }
    
    static var someItems2 : [allItemsMain] = (1...24).map {
        allItemsMain(newItem: "item \($0)")
    }
}

struct GridView: View {
    
    // there's no VGrid or HGrid, just the lazy versions
    private let allItems = (1...24).map { "item \($0)" }
    private let col1 : [GridItem] = [
        // the number of items you specify here determins the number of columns
        // you see on the grid
        // order also matters
        GridItem(.flexible(minimum: 80, maximum: 120)),
        GridItem(.flexible())
    ]
    
    private let col2 : [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(80))
    ]
    
    private let col3 : [GridItem] = [
        // adaptive grid calculates how many grid can fill
        // up the space on a line and fills it up with those grids
        // using the settings you've defined
        // you might get a different number of grids on a line
        // you have to set a minimum value btw
        
        GridItem(.adaptive(minimum: 160, maximum: 200)),
        GridItem(.adaptive(minimum: 80))
    
    ]
    
    var body: some View {
        
        ScrollView {
            VGridExample
            HGridExample
        }
            

    }
}

#Preview {
    GridView()
}


private extension GridView {
    var GridSection : some View {
        VStack {
            Section {
                ForEach(0...12, id: \.self) {
                    item in
                    Text("Item " + String(item))
                        .padding(.bottom, 8)
                }
            } header: {
                Text("Lyrics")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.mint)
            }
        }
    }
    
    // main grids
    var VGridExample : some View {
        ScrollView (showsIndicators : false) {
            LazyVGrid (columns: col2, alignment: .leading, spacing: 24, pinnedViews: .sectionHeaders) {
                // items are automatically aligned to the center
                // spacing deetermines the distance between each column
                
                Section {
                    ForEach(allItemsMain.someItems) {
                        item in
                        Text(item.newItem)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 56)
                            .background(.blue,
                                        in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                } header: {
                    Text("Blue Grids")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                }
                
                Section {
                    ForEach(allItemsMain.someItems2) {
                        item in
                        Text(item.newItem)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 56)
                            .background(.red,
                                        in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                } header: {
                    Text("Red Grids")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.red)
                }
            }
        }
        .padding()
        .ignoresSafeArea(edges: .bottom)
    }
    
    var HGridExample : some View {
        ScrollView (.horizontal, showsIndicators : false) {
            LazyHGrid (rows: col2, alignment: .top, spacing: 24, pinnedViews: .sectionHeaders) {
                // items are automatically aligned to the center
                // spacing deetermines the distance between each column
                
                Section {
                    ForEach(allItemsMain.someItems) {
                        item in
                        Text(item.newItem)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 56)
                            .background(.blue,
                                        in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                } header: {
                    Text("Blue Grids")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                }
                
                Section {
                    ForEach(allItemsMain.someItems2) {
                        item in
                        Text(item.newItem)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 56)
                            .background(.red,
                                        in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                } header: {
                    Text("Red Grids")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.red)
                }
            }
        }
        .padding()
        .ignoresSafeArea(edges: .bottom)
    }
    
}
