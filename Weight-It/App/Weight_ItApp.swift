//
//  Weight_ItApp.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import SwiftUI
import SwiftData

@main
struct Weight_ItApp: App {
    //Inject data into the app so we can access anywhere
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //Inject data into the app so we can access anywhere
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        .modelContainer(for: Settings.self)
    }
}
