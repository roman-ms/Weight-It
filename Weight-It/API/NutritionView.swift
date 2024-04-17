import Foundation
import SwiftUI

struct NutritionView: View {
    @StateObject private var viewModel = NutritionViewModel()
    var searchQuery: String

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else if let nutritionModel = viewModel.nutritionModel {
                NavigationView {
                    VStack {
                        SectorChart(products: [
                            Product(title: "Protein", revenue: nutritionModel.totalNutrients.PROCNT.quantity),
                            Product(title: "Carbs", revenue: nutritionModel.totalNutrients.CHOCDF.quantity),
                            Product(title: "Fat", revenue: nutritionModel.totalNutrients.FAT.quantity),
                            Product(title: "Fiber", revenue: nutritionModel.totalNutrients.PROCNT.quantity),
                        ])

                        VStack(spacing: 10) { // Increase spacing between lines here, adjust the value as needed
                            HStack {
                                Text("Energy (kcal): ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.ENERC_KCAL.quantity, specifier: "%.2f") \(nutritionModel.totalNutrients.ENERC_KCAL.unit)")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Carbohydrate: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.CHOCDF.quantity) g")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Fat: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.FAT.quantity) g")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Protein: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.PROCNT.quantity) g")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Fiber: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.FIBTG.quantity) g")
                                Spacer()
                            }
                        }
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20)
                        Spacer()
                    }
                    .navigationTitle(searchQuery)
                }
            } else {
                Text("No data available.")
            }
        }
        .padding()
        .navigationTitle("Nutrition Details")
        .onAppear {
            viewModel.loadNutritionData(for: searchQuery)
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView(searchQuery: "100g Chicken curry")
    }
}
