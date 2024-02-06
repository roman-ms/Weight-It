//
//  ClassificationResults.swift
//  FoodClassifier
//
//  Created by Roman Meshkov on 2/1/24.
//

import Combine

class ClassificationResults: ObservableObject {
    @Published var identifier: String = ""
    @Published var confidence: Double = 0.0
}
