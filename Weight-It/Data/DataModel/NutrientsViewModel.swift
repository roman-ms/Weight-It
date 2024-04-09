//
//  NutrientsViewModel.swift
//  Weight-It
//
//  Created by Roman Meshkov on 4/8/24.
//

import Foundation
import SwiftUI

class NutrientsViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() {
        // Simulate fetching data from a database
        DispatchQueue.global(qos: .background).async {
            let fetchedProducts = [
                // Replace this with your actual database fetching logic
                Product(title: "Product 1", revenue: 0.4),
                Product(title: "Product 2", revenue: 0.2),
                Product(title: "Product 3", revenue: 0.3),
                Product(title: "Product 4", revenue: 0.1)
            ]
            
            DispatchQueue.main.async {
                self.products = fetchedProducts
            }
        }
    }
}

