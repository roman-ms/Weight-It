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
}

struct Fonts {
    static func primary(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    static func secondary(size: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
        // Add more font styles as needed
    }
}
