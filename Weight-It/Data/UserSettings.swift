//
//  UserSettings.swift
//  Weight-It
//
//  Created by Roman Meshkov on 3/5/24.
//

// UserSettings.swift

import Foundation
import Combine

class UserSettings: ObservableObject {
    static let shared = UserSettings()

    @Published var sexInput: String {
        didSet {
            UserDefaults.standard.set(sexInput, forKey: "sexInput")
        }
    }
    
    @Published var weightInput: String {
        didSet {
            UserDefaults.standard.set(weightInput, forKey: "weightInput")
        }
    }
    
    @Published var heightInput: String {
        didSet {
            UserDefaults.standard.set(heightInput, forKey: "heightInput")
        }
    }
    
    @Published var ageInput: String {
        didSet {
            UserDefaults.standard.set(ageInput, forKey: "ageInput")
        }
    }
    
    @Published var lifestyleInput: String {
        didSet {
            UserDefaults.standard.set(lifestyleInput, forKey: "lifestyleInput")
        }
    }
    
    @Published var goalsInput: String {
        didSet {
            UserDefaults.standard.set(goalsInput, forKey: "goalsInput")
        }
    }
    
    @Published var tunitsInput: String {
        didSet {
            UserDefaults.standard.set(tunitsInput, forKey: "tunitsInput")
        }
    }
    
    @Published var wunitsInput: String {
        didSet {
            UserDefaults.standard.set(wunitsInput, forKey: "wunitsInput")
        }
    }
    
    @Published var notificationsInput: Bool {
        didSet {
            UserDefaults.standard.set(notificationsInput, forKey: "notificationsInput")
        }
    }
    
    @Published var lunchboxInput: Bool {
        didSet {
            UserDefaults.standard.set(lunchboxInput, forKey: "lunchboxinput")
        }
    }

    /// TDEE using Mifflin-St Jeor BMR × activity multiplier.
    /// Returns 2000 as a safe default if profile data is missing or unparseable.
    var tdee: Double {
        guard
            let weight = Double(weightInput),
            let height = Double(heightInput),
            let age = Double(ageInput)
        else { return 2000 }

        // Mifflin-St Jeor BMR
        let bmr: Double
        if sexInput == "Female" {
            bmr = 10 * weight + 6.25 * height - 5 * age - 161
        } else {
            bmr = 10 * weight + 6.25 * height - 5 * age + 5
        }

        let multiplier: Double
        switch lifestyleInput {
        case "Sedentary":  multiplier = 1.2
        case "Moderate":   multiplier = 1.55
        case "Active":     multiplier = 1.725
        default:           multiplier = 1.2
        }

        return bmr * multiplier
    }

    init() {
        self.sexInput = UserDefaults.standard.object(forKey: "sexInput") as? String ?? "Male"
        self.weightInput = UserDefaults.standard.object(forKey: "weightInput") as? String ?? "92"
        self.heightInput = UserDefaults.standard.object(forKey: "heightInput") as? String ?? "188"
        self.ageInput = UserDefaults.standard.object(forKey: "ageInput") as? String ?? "23"
        self.lifestyleInput = UserDefaults.standard.object(forKey: "lifestyleInput") as? String ?? "Active"
        self.goalsInput = UserDefaults.standard.object(forKey: "goalsInput") as? String ?? "Maintain"
        self.tunitsInput = UserDefaults.standard.object(forKey: "tunitsInput") as? String ?? "12 hr"
        self.wunitsInput = UserDefaults.standard.object(forKey: "wunitsInput") as? String ?? "Kg/Cm"
        self.notificationsInput = UserDefaults.standard.object(forKey: "notificationsInput") as? Bool ?? false
        self.lunchboxInput = UserDefaults.standard.object(forKey: "lunchboxinput") as? Bool ?? false
    }
}


