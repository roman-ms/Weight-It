//
//  CalBar.swift
//  Weight-It
//
//  Created by Roman Meshkov on 1/4/24.
//

import SwiftUI

struct ProgressBar: View {
    var value: CGFloat // This will be the number that determines the fill

    var body: some View {
        VStack{
            Text("Today's Caloeries:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .bold()
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background of the progress bar
                    Rectangle()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)

                    // Filled part of the progress bar
                    Rectangle()
                        .frame(width: min(CGFloat(self.value)/100.0 * geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color.blue)
                        .animation(.linear, value: value)
                }
                .cornerRadius(45.0)
            }
            .padding(.horizontal) // Adds padding around the progress bar
        }
    }
}

