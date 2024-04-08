//
//  BarChart.swift
//  Weight-It
//
//  Created by Roman Meshkov on 4/4/24.
//

import Foundation
import SwiftUI
import Charts
import CoreData

struct WeeklyCaloriesBarChart: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest var food: FetchedResults<Food>
    
    // Initialize FetchRequest to fetch foods for the current week
    init() {
        let calendar = Calendar.current
        let startOfWeek = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        let startOfWeekDate = calendar.date(from: startOfWeek)!
        
        let endOfWeekDate = calendar.date(byAdding: .day, value: 7, to: startOfWeekDate)!
        
        let predicate = NSPredicate(format: "(date >= %@) AND (date < %@)", startOfWeekDate as NSDate, endOfWeekDate as NSDate)
        _food = FetchRequest(sortDescriptors: [SortDescriptor(\.date)], predicate: predicate)
    }
    
    private func groupAndSumCaloriesByDayOfWeek() -> [(key: String, value: Int)] {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE" // Abbreviated day name, e.g., "Mon", "Tue", etc.
        
        var dailyCalories: [String: Int] = [:]
        
        for item in food {
            let dayOfWeek = dateFormatter.string(from: item.date ?? Date())
            dailyCalories[dayOfWeek, default: 0] += Int(item.kcal)
        }
        
        let dayOfWeekOrder: [String: Int] = ["Sun": 0, "Mon": 1, "Tue": 2, "Wed": 3, "Thu": 4, "Fri": 5, "Sat": 6]
        
        // Convert dictionary to an array and sort by custom day of the week order
        return dailyCalories
            .map { ($0.key, $0.value) }
            .sorted { dayOfWeekOrder[$0.key]! < dayOfWeekOrder[$1.key]! }
    }

    var body: some View {
        Chart {
            ForEach(groupAndSumCaloriesByDayOfWeek(), id: \.key) { dayOfWeek, totalCalories in
                BarMark(
                    x: .value("Day", dayOfWeek),
                    y: .value("Calories", totalCalories)
                )
                .opacity(0.7)
                .foregroundStyle(.blue)
            }
        }
        .padding()
    }
}
