//
//  Settings.swift
//  Weight-It
//
//  Created by Roman Meshkov on 4/3/24.
//

import SwiftUI

struct SettingItemView: View {
    //Title displays the name of the parameter
    let title: String
    //Type defines what kind of user input it has
    let type: String
    var pickerOptions: [String]? = nil
    @Binding var userInput: String
    @State private var hasLunchBox: Bool = false

    var body: some View {
        HStack{
            Text(title)

            if type == "Text" {
                Spacer()
                TextField("", text: $userInput)
                    .frame(width: 100)
                    .cornerRadius(5) // Optionally, add a corner radius for rounded corners
            }
            else if type == "Picker" {
                Spacer()
                Picker(selection: $userInput, label: Text("")) {
                        if let options = pickerOptions { // Safely unwrap the optional
                            ForEach(options, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        } else {
                            // Handle the case where there are no options (e.g., display a default option)
                            Text("No options available").tag("No options")
                        }
                    }
                .frame(width: 200)
            } else if type == "Bool" {
                Toggle("", isOn: $hasLunchBox)
            }
        }
    }
}

struct SettingsView: View {
    @ObservedObject var userSettings = UserSettings.shared
    
    var body: some View {
        Form {
            Section(header: Text("Settings")){
                SettingItemView(title: "Lunchbox Connect",
                                type: "Bool",
                                userInput: .constant(String(userSettings.lunchboxInput))) // This should likely be another Bool property, not the 'sexInput'.
                SettingItemView(title: "Notifications",
                                type: "Bool",
                                userInput: .constant(String(userSettings.notificationsInput)))
            }
            
            Section(header: Text("Units")){
                SettingItemView(title: "Measurement",
                                type: "Picker",
                                pickerOptions: ["Kg/Cm", "lbs/inch"],
                                userInput: $userSettings.wunitsInput)
                SettingItemView(title: "Time",
                                type: "Picker",
                                pickerOptions: ["12 hr", "24 hr"],
                                userInput: $userSettings.tunitsInput) // This might need a separate binding for time units.
            }
            
            
            Section(header: Text("User Profile")){
                SettingItemView(title: "Sex",
                                type: "Picker",
                                pickerOptions: ["None", "Male", "Female"],
                                userInput: $userSettings.sexInput)
                SettingItemView(title: "Age",
                                type: "Text",
                                userInput: $userSettings.ageInput)
                SettingItemView(title: "Weight",
                                type: "Text",
                                userInput: $userSettings.weightInput)
                SettingItemView(title: "Height",
                                type: "Text",
                                userInput: $userSettings.heightInput)
                SettingItemView(title: "Goals",
                                type: "Picker",
                                pickerOptions: ["None", "Lose", "Maintain", "Gain"],
                                userInput: $userSettings.goalsInput)
                SettingItemView(title: "Lifestyle:",
                                type: "Picker",
                                pickerOptions: ["None", "Active", "Moderate", "Sedentary"],
                                userInput: $userSettings.lifestyleInput)
            }
            
            
            // Calculate daily calories and format it as a string
            let formattedCalories = String(format: "%.2f", calculateDailyCalories())

            // Combine the title and formatted value into one string with a line break
            let headerText = "Calculated Daily Calories: \n\(formattedCalories)"

            // Use the combined string in a single Text view, aligning it to the center
            Section(header:
                Text(headerText)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            ) {
                
            }
        }
    }
    
    
    func calculateDailyCalories() -> Double {
        guard let age = Double(userSettings.ageInput),
              let weight = Double(userSettings.weightInput),
              let height = Double(userSettings.heightInput) else {
            return 0
        }
        
        var bmr: Double
        if userSettings.sexInput == "Male" {
            bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
        } else {
            bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
        }
        
        let activityLevels: [String: Double] = [
            "Sedentary": 1.2,
            "Moderate": 1.55,
            "Active": 1.725
        ]
        
        guard let activityMultiplier = activityLevels[userSettings.lifestyleInput] else {
            return 0
        }
        
        return bmr * activityMultiplier
    }

}

#Preview {
    SettingsView()
}
