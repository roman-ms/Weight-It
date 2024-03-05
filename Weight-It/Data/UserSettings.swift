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
    
    @Published var unitsInput: String {
        didSet {
            UserDefaults.standard.set(unitsInput, forKey: "unitsInput")
        }
    }
    
    @Published var notificationsInput: Bool {
        didSet {
            UserDefaults.standard.set(notificationsInput, forKey: "notificationsInput")
        }
    }
    
    @Published var lunchboxInput: Bool {
        didSet {
            UserDefaults.standard.set(notificationsInput, forKey: "notificationsInput")
        }
    }

    init() {
        self.sexInput = UserDefaults.standard.object(forKey: "sexInput") as? String ?? ""
        self.weightInput = UserDefaults.standard.object(forKey: "weightInput") as? String ?? ""
        self.heightInput = UserDefaults.standard.object(forKey: "heightInput") as? String ?? ""
        self.ageInput = UserDefaults.standard.object(forKey: "ageInput") as? String ?? ""
        self.lifestyleInput = UserDefaults.standard.object(forKey: "lifestyleInput") as? String ?? ""
        self.goalsInput = UserDefaults.standard.object(forKey: "goalsInput") as? String ?? ""
        self.unitsInput = UserDefaults.standard.object(forKey: "unitsInput") as? String ?? "Kg/Cm"
        self.notificationsInput = UserDefaults.standard.object(forKey: "notificationsInput") as? Bool ?? false
        self.lunchboxInput = UserDefaults.standard.object(forKey: "lunchboxinput") as? Bool ?? false
    }
}


