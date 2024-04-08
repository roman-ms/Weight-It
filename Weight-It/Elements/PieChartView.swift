//
//  ChartView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 1/19/24.
//

import Foundation
import SwiftUI
import Charts // If you're using iOS 16 and above, Charts is available.

// Define your data model
struct ChartData: Identifiable {
    let id = UUID()
    let parameter: String
    let value: Double
}

// ViewModel to encapsulate the data handling
class ChartViewModel: ObservableObject {
    // Private data variable
    @Published private(set) var data: [ChartData] = [
        ChartData(parameter: "Jan", value: 10),
        ChartData(parameter: "Feb", value: 20),
        ChartData(parameter: "Mar", value: 15)
        // Add more data as needed
    ]
    
    // Public method to fetch or update data
    // This is where you would add methods to manipulate your data,
    // such as fetching it from a database or an API.
}

// SwiftUI View for displaying the charts
struct ChartsView: View {
    @StateObject private var viewModel = ChartViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Line Chart
                    if #available(iOS 16.0, *) {
                        Chart {
                            ForEach(viewModel.data) { item in
                                LineMark(
                                    x: .value("Parameter", item.parameter),
                                    y: .value("Value", item.value)
                                )
                            }
                        }
                        .frame(height: 200)
                        .padding()
                    }

                    // Bar Chart
                    if #available(iOS 16.0, *) {
                        Chart {
                            ForEach(viewModel.data) { item in
                                BarMark(
                                    x: .value("Parameter", item.parameter),
                                    y: .value("Value", item.value)
                                )
                            }
                        }
                        .frame(height: 200)
                        .padding()
                    }
                }
                .navigationTitle("Charts")
            }
        }
    }
}

// Entry point for the SwiftUI application
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
