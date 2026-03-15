import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var quantity: Double = 0
    @State private var kcal: Int = 0
    @State private var carbs: Int = 0
    @State private var fat: Int = 0
    @State private var protein: Int = 0
    @State private var water: Double = 0
    @State private var fiber: Double = 0
    @State private var date: Date = Date()
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            
            Stepper("Quantity: \(quantity, specifier: "%.2f")g", value: $quantity, step: 1)
            Stepper("Calories: \(kcal) kcal", value: $kcal, step: 1)
            Stepper("Carbs: \(carbs)g", value: $carbs, step: 1)
            Stepper("Fat: \(fat)g", value: $fat, step: 1)
            Stepper("Protein: \(protein)g", value: $protein, step: 1)
            Stepper("Water: \(water, specifier: "%.2f")L", value: $water, step: 0.1)
            Stepper("Fiber: \(fiber, specifier: "%.2f")g", value: $fiber, step: 0.1)
            
            DatePicker("Select Date and Time", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.compact)
            
            HStack {
                Spacer()
                Button("Submit") {
                    DataController.editFood(food: food, name: name,
                                              quantity: quantity,
                                              kcal: Double(kcal),
                                              carbs: Double(carbs),
                                              fat: Double(fat),
                                              protein: Double(protein),
                                              water: water,
                                              fiber: fiber,
                                              date: date, // Update the function to accept and handle the date and time
                                              context: managedObjContext)
                    dismiss()
                }
                Spacer()
            }
        }
        .onAppear {
            name = food.name ?? ""
            quantity = food.quantity
            kcal = Int(food.kcal)
            carbs = Int(food.carbs)
            fat = Int(food.fat)
            protein = Int(food.protein)
            water = food.water
            fiber = food.fiber
            date = food.date ?? Date() // Initialize with the current date and time from the food item
        }
        .navigationTitle("Edit Food")
    }
}
