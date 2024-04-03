//
//  ContentView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var selectedTabIndex = 2 // Assuming ProductsView is intended to be the default

    var body: some View {
        TabView(selection: $selectedTabIndex){
            InsightView()
                .tabItem {
                    Text("Insights")
                    Image(systemName: "chart.pie")
                }.tag(1)
                
            
            ProductsView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                  }.tag(2) // This tag matches the initial state, making ProductsView the default
                
            
            SettingsView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gearshape")
                }.tag(3)
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
