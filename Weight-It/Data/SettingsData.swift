//
//  File.swift
//  Weight-It
//
//  Created by Roman Meshkov on 1/24/24.
//

import Foundation
import SwiftData

@Model
class Settings {
    //User Settings
    var sex: String
    var weight: Float
    var height: Float
    var age: Decimal
    var lifestyle: String
    var goals: String
    
    //Other Settings
    var otherInput = ""
    var unitsInput = ""
    var NotificationsInput = ""
    
    init(sex: String, age: Decimal, weight: Float, height: Float, goals: String, lifestyle: String ){
        self.sex = sex
        self.weight = weight
        self.height = height
        self.age = age
        self.goals = goals
        self.lifestyle = lifestyle
    }
}
