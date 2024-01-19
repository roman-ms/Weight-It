//
//  PieChartView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 1/19/24.
//

import SwiftUI

//
//  PieChart.swift
//  Weight-It
//
//  Created by Roman Meshkov on 1/19/24.
//

import Foundation
import SwiftUI

struct PieSlice: Identifiable {
    let id = UUID()
    let startAngle: Angle
    let endAngle: Angle
    let color: Color
}

struct PieChartView: View {
    var slices: [PieSlice]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(slices) { slice in
                    Path { path in
                        let width = min(geometry.size.width, geometry.size.height)
                        let height = width

                        let center = CGPoint(x: width / 2, y: height / 2)
                        path.move(to: center)

                        path.addArc(center: center, radius: width / 2,
                                    startAngle: slice.startAngle,
                                    endAngle: slice.endAngle,
                                    clockwise: false)
                    }
                    .fill(slice.color)
                }
            }
        }
    }
}


