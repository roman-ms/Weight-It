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
        let data = groupAndSumCaloriesByDayOfWeek()
        let caloriesGoal = Int(UserSettings.shared.tdee)
        
        if data.isEmpty {
            // Display "No Data" message for empty data
            ZStack {
                Chart {
                    ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                        BarMark(
                            x: .value("Day", day),
                            y: .value("Calories", 0)
                        )
                        .opacity(0)
                    }
                }
                .frame(height: 150)
                .padding()
                
                Text("No Data")
                    .foregroundColor(.gray)
                    .font(.title)
            }
        } else {
            // Display chart with data
            Chart {
                ForEach(data, id: \.key) { dayOfWeek, totalCalories in
                    BarMark(
                        x: .value("Day", dayOfWeek),
                        y: .value("Calories", totalCalories)
                    )
                    .opacity(0.7)
                    .foregroundStyle(Color(hex: "0D8D60"))
                }
                // Add the RuleMark for the calories goal
                RuleMark(
                    y: .value("Goal", caloriesGoal)
                )
                .lineStyle(StrokeStyle(lineWidth: 2, dash: [5])) // Makes the line dotted
                .foregroundStyle(.red) // Sets the color to red
            }
            .frame(height: 150)
            .padding(10)
        }
    }

}
