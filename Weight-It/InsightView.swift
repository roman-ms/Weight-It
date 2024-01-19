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
                HStack{
                    PieChartView(slices: slices)
                        .frame(width: 140, height: 140)
                        .padding(.horizontal, 20)
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
                    Spacer()
                }
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
