//
//  InsightView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import Foundation
import SwiftUI

struct InsightView: View {
    let sampleStats = [
        Stats(city: "Mon", population: 2000, gender: .female),
        Stats(city: "Tue", population: 3900, gender: .male),
        Stats(city: "Wed", population: 2700, gender: .notSet),
        Stats(city: "Thu", population: 2700, gender: .notSet),
        Stats(city: "Fri", population: 2700, gender: .notSet),
        Stats(city: "Sat", population: 2700, gender: .notSet),
        Stats(city: "Sun", population: 2700, gender: .notSet)
    ]
    
    var body: some View {
        Form{
            Section(header: Text("Distribution")){
                HStack{
                    Spacer()
                    SectorChart()
                    Spacer()
                }
            }
            
            Section(header: Text("Week")){
                VStack{
                    BarChart(stats: sampleStats)
                    
                }
            }
            
            Section(header: Text("Today")){
                VStack{
                    SectorChart()
                }
            }
        }
    }
}

struct InsightView_Previews: PreviewProvider {
    static var previews: some View {
        InsightView()
    }
}
