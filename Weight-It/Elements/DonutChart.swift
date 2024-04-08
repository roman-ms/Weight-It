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
    @State private var products: [Product] = [
        .init(title: "Carbs", revenue: 0.7),
        .init(title: "Fats", revenue: 0.2),
        .init(title: "Protein", revenue: 0.1)
    ]
    
    var body: some View {
        HStack {
            // Chart
            Chart(products) { product in
                SectorMark(
                    angle: .value(
                        Text(verbatim: product.title),
                        product.revenue
                    ),
                    innerRadius: .ratio(0.6),
                    angularInset: 8
                )
                .foregroundStyle(
                    by: .value(
                        Text(verbatim: product.title),
                        product.title
                    )
                )
            }
        }
    }
}

struct SectorChartExample_Previews: PreviewProvider {
    static var previews: some View {
        SectorChart()
    }
}
