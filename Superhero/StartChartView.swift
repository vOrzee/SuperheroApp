//
//  StartChartView.swift
//  Superhero
//
//  Created by Роман Лешин on 29.11.2024.
//

import SwiftUI

struct StatChartView: View {
    let title: String
    let value: Int
    let maxValue: Int
    let color: Color
    @Binding var animate: Bool

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(color)

                Circle()
                    .trim(from: 0.0, to: animate ? CGFloat(value) / CGFloat(maxValue) : 0.0)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .foregroundColor(color)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 3.5), value: animate)

                Text("\(value)%")
                    .font(.title)
                    .bold()
            }
            .frame(width: 150, height: 150)

            Text(title)
                .font(.headline)
                .padding(.top, 8)
        }
    }
}
