//
//  EditFoodView.swift
//  UserData
//
//  Created by Roman Meshkov on 3/5/24.
//

import SwiftUI

struct EditFoodView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    //required for each edit food view
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var quantity: Double = 0
    
    var body: some View {
        Form{
            TextField("\(food.name!)", text: $name)
                .onAppear{
                    name = food.name!
                    quantity = food.quantity
                }
            VStack{
                Text("Calories \(Int(food.kcal)) - \(Int(quantity)) g")
                Text("Carbs \(Int(food.carbs))")
                Text("Fat \(Int(food.fat))")
                Text("Protein \(Int(food.protein))")
            }
            .padding()

            HStack{
                Spacer()
                Button("Submit"){
                    DataController().editFood(food: food, name: name,
                                              quantity: quantity,
                                              kcal: food.kcal,
                                              carbs: food.carbs,
                                              fat: food.fat,
                                              protein: food.protein,
                                              context: managedObjContext)
                    dismiss()
                }
                Spacer()
            }
        }
        .navigationTitle("Edit Food")
    }
}
