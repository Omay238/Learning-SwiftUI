//
//  ContentView.swift
//  BarChartHackwich
//
//  Created by Omay Operations on 11/27/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    let categories = ["Coding", "Gaming", "Sleep", "Stress", "Social Interactions", "Binging YouTube"]
    let percentages = [60, 50, 10, 40, 10, 30]
    let colors: [Color] = [.pink, .blue, .purple, .red, .yellow, .orange]
    var body: some View {
        Text("It's the stuff I may have done I guess")
            .font(.system(size: 25))
        Chart {
            ForEach(categories.indices, id: \.self) { index in
                BarMark(
                    x: .value("Category", categories[index]),
                    y: .value("Percentage", percentages[index])
                )
                .foregroundStyle(colors[index])
            }
        }
        Text("Man I have no idea for design here")
    }
}

#Preview {
    ContentView()
}
