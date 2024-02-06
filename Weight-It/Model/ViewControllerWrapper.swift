//
//  ViewControllerWrapper.swift
//  FoodClassifier
//
//  Created by Roman Meshkov on 2/1/24.
//

import SwiftUI

// SwiftUI wrapper for your UIKit ViewController
struct ViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    // Add a property to store the captured image
    var capturedImage: UIImage?

    func makeUIViewController(context: Context) -> ViewController {
        // Initialize and return your ViewController
        let viewController = ViewController()
        
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Handle any updates to your ViewController, if needed
    }
}
