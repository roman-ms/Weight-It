//
//  NetworkManager.swift
//  Edamam
//
//  Created by Roman Meshkov on 2/22/24.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    func fetchNutritionData(for ingredient: String, completion: @escaping (Result<NutritionModel, Error>) -> Void) {
        var urlComponents = URLComponents(string: "https://api.edamam.com/api/nutrition-data")!
        urlComponents.queryItems = [
            URLQueryItem(name: "app_id", value: "7d4d9421"),
            URLQueryItem(name: "app_key", value: "11bf777843956c24d4192ca534661441"),
            URLQueryItem(name: "ingr", value: ingredient)
        ]
        
        guard let url = urlComponents.url else {
            completion(.failure(NSError(domain: "NetworkManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NSError(domain: "NetworkManager", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])))
                return
            }
            
            do {
                // Decode the JSON data to your Codable struct
                let decodedData = try JSONDecoder().decode(NutritionModel.self, from: data)
                completion(.success(decodedData)) // Pass the decoded object to your completion handler
            } catch {
                completion(.failure(error)) // Handle any errors during decoding
            }
        }
        
        task.resume()
    }
}
