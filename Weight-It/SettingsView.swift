//
//  SettingsView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import Foundation
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
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(AppColors.primaryColor))
                .frame(height: 50)
            HStack{
                Text(title)
                    .foregroundColor(.white)
                    .padding(.leading, 10) // Adjust the padding as needed
                    .foregroundColor(.white)
                Spacer()
                if type == "Text" {
                    TextField("Enter \(String(title.dropLast()))", text: $userInput)
                        .padding(10)
                        .frame(width: 150, height: 30)
                        .background(Color.white)
                        .cornerRadius(45.0)
                        .foregroundColor(.black)
                }
                else if type == "Picker" {
                    Picker(selection: $userInput, label: Text("Select \(String(title.dropLast()))")) {
                            if let options = pickerOptions { // Safely unwrap the optional
                                ForEach(options, id: \.self) { option in
                                    Text(option).tag(option)
                                }
                            } else {
                                // Handle the case where there are no options (e.g., display a default option)
                                Text("No options available").tag("No options")
                            }
                        }
                    .padding(10)
                    .frame(width: 150, height: 30)
                    .background(Color.white)
                    .cornerRadius(45.0)
                } else if type == "Bool" {
                    Toggle("", isOn: $hasLunchBox)
                        .padding(10)

                }
                Spacer()
                    .frame(width: 10)
            }
        }
    }
}

struct SettingsView: View {
    //User information
    @State private var sexInput = ""
    @State private var weightInput = ""
    @State private var heightInput = ""
    @State private var ageInput = ""
    @State private var lifestyleInput = ""
    @State private var goalsInput = ""
    @State private var otherInput = ""
    @State private var unitsInput = ""
    @State private var NotificationsInput = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                HStack{
                Text("User Profile")
                    .bold()
                    Spacer()
                }
                SettingItemView(title: "Sex:",
                                type: "Picker",
                                pickerOptions: ["None","Male", "Female"],
                                userInput: $sexInput)
                SettingItemView(title: "Age:",
                                type: "Text",
                                userInput: $ageInput)
                SettingItemView(title: "Weight:",
                                type: "Text",
                                userInput: $weightInput)
                SettingItemView(title: "Height:",
                                type: "Text",
                                userInput: $heightInput)
                SettingItemView(title: "Goals:",
                                type: "Picker",
                                pickerOptions: ["None", "Lose", "Maintain", "Gain"],
                                userInput: $goalsInput)
                SettingItemView(title: "Lifestyle:",
                                type: "Picker",
                                pickerOptions: ["None", "Active", "Moderate", "Sedentary"],
                                userInput: $lifestyleInput)
                HStack{
                Text("Settings")
                    .bold()
                    Spacer()
                }
                SettingItemView(title: "Lunchbox Connect",
                                type: "Bool",
                                userInput: $sexInput)
                SettingItemView(title: "Notifications",
                                type: "Bool",
                                userInput: $NotificationsInput)
                SettingItemView(title: "Measurment Units",
                                type: "Picker",
                                pickerOptions: ["Kg/Cm", "lbs/inch"],
                                userInput: $unitsInput)
                SettingItemView(title: "Time Units",
                                type: "Picker",
                                pickerOptions: ["12 hr", "24 hr"],
                                userInput: $unitsInput)
            }
            .padding()
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
