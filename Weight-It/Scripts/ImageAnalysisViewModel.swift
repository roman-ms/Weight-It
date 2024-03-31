//
//  ImageAnalysisViewModel.swift
//  Weight-It
//
//  Created by Roman Meshkov on 3/9/24.
//

import SwiftUI
import UIKit

class ImageAnalysisViewModel: ObservableObject {
    @Published var isClassifying: Bool = false
    @Published var classificationResult: String?
    @Published var classificationConfidence: String?

    func classifyImage(_ image: UIImage?) {
        guard let image = image else { return }
        
        let viewController = ViewController()
        isClassifying = true

        DispatchQueue.global().async {
            viewController.classifyImage(image) { [weak self] result in
                DispatchQueue.main.async {
                    if let result = result {
                        self?.classificationResult = result.split(separator: "-").first?.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "_", with: " ") ?? ""
                        self?.classificationConfidence = result.split(separator: "-").last?.trimmingCharacters(in: .whitespaces) ?? ""
                    } else {
                        self?.classificationResult = "Nothing recognized."
                    }
                    self?.isClassifying = false
                }
            }
        }
    }
}

