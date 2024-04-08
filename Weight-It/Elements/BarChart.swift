//
//  BarChart.swift
//  Weight-It
//
//  Created by Roman Meshkov on 4/4/24.
//

import Foundation
import SwiftUI
import Charts


enum Gender: String {
    case male
    case female
    case notSet
}

extension Gender: Plottable {
    var primitivePlottable: String {
        rawValue
    }
}

struct Stats {
    let city: String
    let population: Int
    let gender: Gender
}

struct BarChart: View {
    let stats: [Stats]
    
    var body: some View {
        Chart {
            ForEach(stats, id: \.city) { stat in
                BarMark(
                    x: .value("City", stat.city),
                    y: .value("Population", stat.population)
                )
                .opacity(0.7)
                .foregroundStyle(.red)
            }
        }
        .padding()
    }
}
