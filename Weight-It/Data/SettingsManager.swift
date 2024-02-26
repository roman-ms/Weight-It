//
//  SettingsManager.swift
//  Weight-It
//
//  Created by Ifham Haq on 2/14/24.
//

import Foundation
// Define a class to manage saving and loading settings data
class SettingsManager {
    static let shared = SettingsManager()
    
    private let userDefaults = UserDefaults.standard
    private let settingsKey = "SettingsData"
    
    func saveSettings(_ settings: SettingsData) {
        if let encoded = try? JSONEncoder().encode(settings) {
            userDefaults.set(encoded, forKey: settingsKey)
        }
    }
    
}
