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

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(AppColors.primaryColor))
                .frame(height: 212)
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(10) // Adjust the padding as needed
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
