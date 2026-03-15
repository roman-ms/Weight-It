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
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    @State private var showingAddView = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("\(Int(totalCaloriesToday())) Kcal (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List {
                    ForEach(food) { food in
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name ?? "Unknown")
                                        .bold()
                                    Text("\(Int(food.quantity)) g")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(calcTimeSince(date: food.date ?? Date()))
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Food")
            .toolbar {
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
    }

    private func deleteFood(offset: IndexSet) {
        withAnimation {
            offset.map { food[$0] }.forEach(managedObjContext.delete)
            DataController.save(context: managedObjContext)
        }
    }

    private func totalCaloriesToday() -> Double {
        food.reduce(0.0) { total, item in
            guard let date = item.date, Calendar.current.isDateInToday(date) else { return total }
            return total + item.kcal
        }
    }
}

#Preview {
    ProductsView()
}
