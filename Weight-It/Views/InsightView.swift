//
//  InsightView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import Foundation
import SwiftUI

struct InsightView: View {
    
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
                    WeeklyCaloriesBarChart()
                    
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
