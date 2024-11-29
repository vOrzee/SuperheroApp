//
//  HelloView.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct HeroStatsView: View {
    @State private var animateCharts = false
    @AppStorage("idSelectedHero") private var idSelectedHero: Int = 0
    @ObservedObject var repository: HeroesRepositoryNetworkImpl

    @State var hero: Hero?

    var body: some View {
        NavigationView {
            if let hero {
                ScrollView {
                    VStack(spacing: 32) {
                        Text("Статистика героя")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        
                        ForEach(hero.powerstats.asArray(), id: \.title) { stat in
                            StatChartView(
                                title: stat.title,
                                value: stat.value,
                                maxValue: 100,
                                color: colorForStat(stat.title),
                                animate: $animateCharts
                            )
                            .frame(height: 200)
                        }
                    }
                    .padding()
                }
                .navigationTitle(hero.name)
            } else {
                Text("Герой не выбран")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            }
        }
        .task {
            self.hero = await repository.fetchHero(byId: idSelectedHero)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                animateCharts = true
            }
        }
        .onDisappear {
            animateCharts = false
        }
    }
    func colorForStat(_ title: String) -> Color {
        switch title {
        case "Интеллект": return .blue
        case "Сила": return .red
        case "Скорость": return .green
        case "Выносливость": return .orange
        case "Мощь": return .purple
        case "Бой": return .pink
        default: return .gray
        }
    }
}

#Preview {
    HeroStatsView(repository: HeroesRepositoryNetworkImpl())
}
