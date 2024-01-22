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
        HStack{
            Spacer()
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
            .frame(width: 125, height: 125)
            Spacer()
            Spacer()
            VStack(alignment: .leading) {
                HStack{
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .cornerRadius(45.0)
                        .foregroundColor(AppColors.PieColor1)
                    Text("Protein")
                        .padding(5)
                        .foregroundColor(.white)
                        .bold()
                }
                HStack{
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .cornerRadius(45.0)
                        .foregroundColor(AppColors.PieColor2)
                    Text("Protein")
                        .padding(5)
                        .foregroundColor(.white)
                        .bold()
                }
                HStack{
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .cornerRadius(45.0)
                        .foregroundColor(AppColors.PieColor3)
                    Text("Protein")
                        .padding(5)
                        .foregroundColor(.white)
                        .bold()
                }
            }
            Spacer()
        }
    }
}


