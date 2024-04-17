//
//  InsightView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import SwiftUI

struct InsightView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    //Get data from DB, sord descriptod defines in waht order we fetch the data, returns an array
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    //add view showing variable
    
    var body: some View {
        Form {
            Section(header: Text("Distribution")) {
                SectorChart(products: groupAndSumNutrients())

            }
            
            Section(header: Text("Week")) {
                WeeklyCaloriesBarChart()
            }
            
            Section(header: Text("Today")) {
                HorizontalBarChartView(nutrients: sumNutrientsForToday())
            }
        }
    }
    
    private func groupAndSumNutrients() -> [Product] {
        var totalProtein = 0
        var totalCarbs = 0
        var totalFat = 0
        var totalFiber = 0
        
        // Assuming the Food entity has protein, carbs, fiber, and fat properties
        if food.isEmpty{
            return []
        } else {
            for item in food {
                totalProtein += Int(item.protein)
                totalCarbs += Int(item.carbs)
                totalFat += Int(item.fat)
                totalFiber += Int(item.fiber)
            }
            
            return [
                Product(title: "Protein", revenue: Double(totalProtein)),
                Product(title: "Carbs", revenue: Double(totalCarbs)),
                Product(title: "Fat", revenue: Double(totalFat)),
                Product(title: "Fiber", revenue: Double(totalFiber)),
            ]
        }
    }
    
    private func sumNutrientsForToday() -> [Product] {
        var totalProtein = 0
        var totalCarbs = 0
        var totalFat = 0
        var totalFiber = 0
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date()) // Get start of today to compare dates
        
        if food.isEmpty{
            return []
        } else {
            // Assuming the Food entity has a date and nutritional properties (protein, carbs, fiber, fat)
            for item in food {
                if let itemDate = item.date, calendar.isDate(itemDate, inSameDayAs: today) {
                    // Item is consumed today, sum its nutrients
                    totalProtein += Int(item.protein)
                    totalCarbs += Int(item.carbs)
                    totalFat += Int(item.fat)
                    totalFiber += Int(item.fiber)
                }
            }
            
            return [
                Product(title: "Protein", revenue: Double(totalProtein)),
                Product(title: "Carbs", revenue: Double(totalCarbs)),
                Product(title: "Fat", revenue: Double(totalFat)),
                Product(title: "Fiber", revenue: Double(totalFiber)),
            ]
        }
    }
}

struct InsightView_Previews: PreviewProvider {
    static var previews: some View {
        InsightView()
    }
}
