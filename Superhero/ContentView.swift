//
//  ContentView.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var repository = HeroesRepositoryNetworkImpl()
    @AppStorage("idSelectedHero") private var idSelectedHero: Int = 0
    
    var body: some View {
        TabView {
            InfoView(repository: repository)
                .tabItem {
                    Label("Герои", systemImage: "person.crop.circle.badge.checkmark")
                }
            HeroStatsView(repository: repository)
                .tabItem {
                    Label("Stats", systemImage: "chart.pie.fill")
                }
            SettingsView(repository: repository)
                .tabItem {
                    Label("Настройки", systemImage: "gearshape")
                }
        }
        .onAppear {
            idSelectedHero = 0
        }
    }
}

#Preview {
    ContentView()
}
