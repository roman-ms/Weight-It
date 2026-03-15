//
//  ContentView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex = 2

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            InsightView()
                .tabItem {
                    Text("Insights")
                    Image(systemName: "chart.pie")
                }.tag(1)

            ProductsView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                }.tag(2)

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
}
