//
//  NutritionViewModel.swift
//  Edamam
//
//  Created by Roman Meshkov on 2/22/24.
//

import Foundation

class NutritionViewModel: ObservableObject {
    @Published var nutritionModel: NutritionModel?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadNutritionData(for ingredient: String) {
        isLoading = true
        NetworkManager.shared.fetchNutritionData(for: ingredient) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let model):
                    self?.nutritionModel = model
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}


