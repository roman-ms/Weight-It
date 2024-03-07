//
//  AddFoodView.swift
//  UserData
//
//  Created by Roman Meshkov on 3/5/24.
//

import SwiftUI

struct AddFoodView: View {
    //Add enviroment
    @Environment (\.managedObjectContext) var managedObjContext
    
    //Closes view when click submit
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form{
            Section{
                TextField("Food Name", text: $name)
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().addFood(name: name, Calories: calories, context: managedObjContext)
                        //Hide the view
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddFoodView()
}
