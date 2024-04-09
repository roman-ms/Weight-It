//
//  DonutChart.swift
//  Weight-It
//
//  Created by Roman Meshkov on 4/4/24.
//

import SwiftUI
import Charts

struct Product: Identifiable {
    let id = UUID()
    let title: String
    let revenue: Double
}

struct SectorChart: View {
    let products: [Product] // Use a constant property for the passed products array
    
    // A predefined set of colors for the chart elements
    private let chartColors: [Color] = [Color(hex: "00000A"), Color(hex: "F63A24"), Color(hex: "0D8D60"), Color(hex: "FFCF00"), Color(hex: "0562AE"), Color(hex: "046A54")]
    
    // No need for a default products array inside the struct
    
    var body: some View {
        HStack {
            // Chart
            Chart {
                ForEach(Array(products.enumerated()), id: \.element.id) { index, product in
                    SectorMark(
                        angle: .value(product.title, product.revenue),
                        innerRadius: .ratio(0.6),
                        angularInset: 8
                    )
                    .foregroundStyle(chartColors[index % chartColors.count]) // Apply color based on index
                }
            }
            
            // Bullet points with items
            VStack(alignment: .leading, spacing: 10) {
                ForEach(Array(products.enumerated()), id: \.element.id) { index, product in
                    HStack {
                        Circle()
                            .fill(chartColors[index % chartColors.count]) // Cycle through the colors
                            .frame(width: 10, height: 10)
                        Text(product.title)
                    }
                }
            }
            .padding(.trailing, 20)
        }
    }
    
}


struct SectorChartExample_Previews: PreviewProvider {
    static var previews: some View {
        SectorChart(products: [
            Product(title: "Custom Product 1", revenue: 0.5),
            Product(title: "Custom Product 2", revenue: 0.3)])
    }
}
