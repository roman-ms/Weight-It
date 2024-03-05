import Foundation
import SwiftUI

struct NutritionView: View {
    @StateObject private var viewModel = NutritionViewModel()
    var searchQuery: String // Variable to hold the classification result

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else if let nutritionModel = viewModel.nutritionModel {
                ScrollView {
                    VStack {
                        Text(searchQuery)
                        Text("Calories: \(nutritionModel.calories)")
                        Text("Total Weight: \(nutritionModel.totalWeight, specifier: "%.2f") grams")
                        // Displaying nutrition information from the nested dictionary
                        Text("Energy (kcal): \(nutritionModel.totalNutrients.ENERC_KCAL.quantity, specifier: "%.2f") \(nutritionModel.totalNutrients.ENERC_KCAL.unit)")
                        Text("Energy Label: \(nutritionModel.totalNutrients.ENERC_KCAL.label)")
                    }
                }
            } else {
                Text("No data available.")
            }
        }
        .padding()
        // Trigger data load when view appears using the passed classification result
        .onAppear {
            let modifiedQuery = searchQuery + " 100 grams"
            viewModel.loadNutritionData(for: modifiedQuery)
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView(searchQuery: "100g Chicken curry")
    }
}
