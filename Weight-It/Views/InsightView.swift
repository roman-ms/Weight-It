//
//  InsightView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import Foundation
import SwiftUI

struct InsightItemView: View {
    let title: String

    
    var slices: [PieSlice] = [
            PieSlice(startAngle: .degrees(0), endAngle: .degrees(100), color: AppColors.PieColor2),
            PieSlice(startAngle: .degrees(100), endAngle: .degrees(200), color: AppColors.PieColor1),
            PieSlice(startAngle: .degrees(200), endAngle: .degrees(360), color: AppColors.PieColor3)
        ]
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(AppColors.primaryColor))
                .frame(height: 212)
            VStack{
                HStack{
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                        .padding(10) // Adjust the padding as needed
                    Spacer()
                }
                PieChartView(slices: slices)
                Spacer()
            }
        }
    }
}

struct InsightView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Insights")
                    .bold()
                VStack(spacing: 10) {
                    InsightItemView(title: "Trends")
                    InsightItemView(title: "Calories")
                    InsightItemView(title: "Nutrition")
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct InsightView_Previews: PreviewProvider {
    static var previews: some View {
        InsightView()
    }
}
