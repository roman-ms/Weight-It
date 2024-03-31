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
            Section{
                TextField("\(food.name!)", text: $name)
                    .onAppear{
                        name = food.name!
                        quantity = food.quantity
                    }
                VStack{
                    Text("Calories \(Int(quantity))")
                    Slider(value: $quantity, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().editFood(food: food, name: name, quantity: quantity, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}
