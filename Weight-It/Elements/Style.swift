//
//  Style.swift
//  Weight-It
//
//  Created by Roman Meshkov on 1/8/24.
//

import SwiftUI

func colorFromRGB(_ red: Double, _ green: Double, _ blue: Double) -> Color {
    return Color(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
}

struct AppColors {
    static let primaryColor = colorFromRGB(147, 197, 114) // Pistachio color
    static let secondaryColor = colorFromRGB(34, 139, 34) // Example secondary color
    
    static let PieColor1 = colorFromRGB(170, 213, 118) // Example secondary color
    static let PieColor2 = colorFromRGB(115, 169, 66) // Example secondary color
    static let PieColor3 = colorFromRGB(83, 141, 34) // Example secondary color
}

import Foundation
import SwiftUI

extension Color {
    // Initialize Color from hexadecimal string
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255 * opacity
        )
    }
}

// Global array of colors defined using hexadecimal strings
let customColors: [Color] = [
    Color(hex: "F63A24"), // red
    Color(hex: "00000A"), // black
    Color(hex: "0562AE"), // blue
    Color(hex: "FFCF00"), // yellow
    Color(hex: "046A54"), // dark green
    Color(hex: "0D8D60"), // green
    Color(hex: "FFFFFF"), // white
    Color(hex: "001B44")  // dark blue
]


