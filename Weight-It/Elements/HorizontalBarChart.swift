import SwiftUI
import Charts

struct HorizontalBarChartView: View {
    let nutrients: [Product]
    
    let staticNutrients: [Product] = [
        Product(title: "Protein", revenue: 40),
        Product(title: "Carbs", revenue: 60),
        Product(title: "Fat", revenue: 80),
        Product(title: "Fiber", revenue: 40)
    ]
    
    private let chartColors: [Color] = [Color(hex: "6E3421"), Color(hex: "F63A24"),Color(hex: "FFCF00"), Color(hex: "0D8D60"), Color(hex: "046A54"), Color(hex: "0562AE")]
    
    var body: some View {
        // Directly decide on which array to use for the chart to avoid type mismatch
        let dataToUse = nutrients.isEmpty ? staticNutrients : nutrients
        
        VStack {
            Chart {
                ForEach(dataToUse.indices, id: \.self) { index in
                    let nutrient = dataToUse[index]
                    BarMark(
                        x: .value("Amount", nutrient.revenue),
                        y: .value("Nutrient", nutrient.title)
                    )
                    .foregroundStyle(chartColors[index % chartColors.count])
                }
            }
            .frame(height: 150)
            .chartXAxis {
                AxisMarks(preset: .automatic, position: .bottom)
            }
            .chartYAxis {
                AxisMarks(preset: .automatic, position: .leading)
            }
            .chartXScale(domain: 0...100) // Set the domain from 0 to 100
        }
        .blur(radius: nutrients.isEmpty ? 5 : 0) // Apply the blur conditionally
        .overlay(
            // Conditionally show "No Data" text if nutrients array is empty
            Text("No Data")
                .font(.title)
                .foregroundColor(.gray)
                .opacity(nutrients.isEmpty ? 1 : 0)
        )
        .padding(10)
    }
}

struct HorizontalBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalBarChartView(nutrients: [])
    }
}
