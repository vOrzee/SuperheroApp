//
//  ContentView.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Label("Герои", systemImage: "person.crop.circle.badge.checkmark")
                }
            HelloView()
                .tabItem {
                    Label("Привет", systemImage: "hand.wave")
                }
            SettingsView()
                .tabItem {
                    Label("Настройки", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
