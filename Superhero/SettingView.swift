//
//  SettingView.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("titleOn") private var titleOn: Bool = true
    @AppStorage("rowHeight") private var rowHeight: Double = 60.0
    @State private var isChanging: Bool = false
    @State private var hero: Hero? = nil
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Внешний вид")) {
                    Text(colorScheme == .light ? "Light Theme enabled" : "Dark Theme enabled")
                }
                Section(header: Text("Заголовки")) {
                    Toggle("Показать навигационные заголовки", isOn: $titleOn)
                        .padding(.vertical, 4)
                    
                    if titleOn {
                        Text("Navigation title enabled")
                            .foregroundColor(.gray)
                            .padding(.top, 4)
                    }
                }
                Section(header: Text("Высота строки")) {
                    Slider(value: $rowHeight, in: 55.0...95.0, step: 1.0) { editing in
                        isChanging = editing
                    }
                    Text("Высота строки: \(Int(rowHeight))")
                    
                    if isChanging, let hero = hero {
                        InfoRow(url: URL(string: hero.images.sm), cacheKey: "\(hero.id)-sm", name: hero.name)
                            .frame(height: rowHeight)
                    }
                }
            }
            .navigationTitle("Настройки")
            .task {
                hero = await HeroesRepositoryNetworkImpl.shared.fetchHero(byId: 1)
            }
        }
    }
}

#Preview {
    SettingsView()
}
