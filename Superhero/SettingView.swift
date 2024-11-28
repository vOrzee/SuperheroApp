//
//  SettingView.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = false
    @State private var selectedTheme = "Тёмная"
    @State private var volume: Double = 50
    
    let themes = ["Светлая", "Тёмная", "Системная"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Основные настройки")) {
                    Toggle("Включить уведомления", isOn: $notificationsEnabled)
                    Picker("Тема", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }
                }
                
                Section(header: Text("Настройки звука")) {
                    Slider(value: $volume, in: 0...100)
                    Text("Громкость: \(Int(volume))%")
                }
            }
            .navigationTitle("Настройки")
        }
    }
}

#Preview {
    SettingsView()
}
