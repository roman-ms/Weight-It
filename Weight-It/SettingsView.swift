//
//  SettingsView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import Foundation
import SwiftUI

struct SettingItemView: View {
    let title: String

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(height: 50)

            Text(title)
                .foregroundColor(.white)
                .padding(.leading, 10) // Adjust the padding as needed
        }
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .bold()

            VStack(spacing: 10) {
                SettingItemView(title: "Weight:")
                SettingItemView(title: "Height:")
                SettingItemView(title: "Age:")
                SettingItemView(title: "Lifestyle:")
                SettingItemView(title: "Goals:")
                SettingItemView(title: "Other")
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
