//
//  DataController.swift
//  Data Project
//
//  Created by Roman Meshkov on 2/19/24.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    //Container is the model itself with all the stored values
    let container = NSPersistentContainer(name: "FoodModel")
    
    //Load the data
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("Could not save the data...")
        }
    }
    
    //We using context to avoid self repetition for each parameter
    func addFood(name: String, Calories: Double, context: NSManagedObjectContext){
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        
        save(context: context)
    }
    
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext){
        food.date = Date()
        food.name = name
        
        save(context: context)
    }
}
