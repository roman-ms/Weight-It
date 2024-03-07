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
    //inject data base
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //injetc into our app
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
