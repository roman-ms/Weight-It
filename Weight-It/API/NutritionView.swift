//
//  NutritionView.swift
//  Edamam
//
//  Created by Roman Meshkov on 2/22/24.
//

import Foundation
import SwiftUI

struct NutritionView: View {
    @StateObject private var viewModel = NutritionViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else if let nutritionModel = viewModel.nutritionModel {
                ScrollView {
                    VStack {
                        Text("Calories: \(nutritionModel.calories)")
                        Text("Total Weight: \(nutritionModel.totalWeight, specifier: "%.2f") grams")
                    }
                }
            } else {
                Text("No data available.")
            }
            
            Button("Load Nutrition Data") {
                viewModel.loadNutritionData(for: "100g Chicken curry")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
    }
}


struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}


