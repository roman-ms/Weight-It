//
//  DataController.swift
//  UserData
//
//  Created by Roman Meshkov on 3/5/24.
//

import Foundation
import CoreData


class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "FoodModel")
    
    //load the data
    init(){
        container.loadPersistentStores {desc, error in
            if let error = error {
                print("Failed to lead the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save ()
            print("Data saved!")
        } catch {
            print("Could not save the data...")
        }
    }
    
    func addFood(name: String, Calories: Double, context: NSManagedObjectContext ) {
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = Calories
        
        //use context to avoid repition of save function
        save(context: context)
    }
    
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext){
        food.date = Date()
        food.name = name
        food.calories = calories
        
        //use context to avoid repition of save function
        save(context: context)
    }
}
