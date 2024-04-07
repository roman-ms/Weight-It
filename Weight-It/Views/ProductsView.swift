//
//  ContentView.swift
//  UserData
//
//  Created by Roman Meshkov on 3/5/24.
//

import SwiftUI
import CoreData

struct ProductsView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    //Get data from DB, sord descriptod defines in waht order we fetch the data, returns an array
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    //add view showing variable
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("\(Int(totalCaloriesToday())) Kcal (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List {
                    ForEach(food) { food in
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack{
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name!)
                                        .bold()
                                    
                                    Text("\(Int(food.quantity))") + Text(" quantity").foregroundColor(.red)
                                }
                                //Pushes rest fo the elements all th way to the right
                                Spacer()
                                Text(calcTimeSince(date:food.date!))
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                //So list style covers all the screen
                .listStyle(.plain)
            }
            .navigationTitle("Food")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddFoodView()
                    } label: {
                        Label("Add Food", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    //
    private func deleteFood(offset: IndexSet){
        withAnimation{
            //map the food to teh current position
            offset.map { food[$0] }.forEach(managedObjContext.delete)
            
            //save delition
            DataController().save(context: managedObjContext)
        }
    }
    
    private func totalCaloriesToday() -> Double{
        var caloriesToday: Double = 0
        for item in food {
            if Calendar.current.isDateInToday(item.date!){
                caloriesToday += item.quantity
            }
        }
        
        return caloriesToday
    }
}


#Preview {
    ProductsView()
}
