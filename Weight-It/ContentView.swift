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

    var body: some View {
        TabView {
            InsightView()
                .tabItem {
                    Text("Insights")
                    Image(systemName: "chart.pie")
                }
            HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                  }
            SettingsView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gearshape")
                }
        }
        .accentColor(Color(AppColors.secondaryColor))
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
