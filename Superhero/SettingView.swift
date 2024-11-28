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
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Внешний вид")) {
                    Text(colorScheme == .light ? "Light Theme enabled" : "Dark Theme enabled")
                }
                Section(header: Text("List Settings")) {
                    Toggle("Show Navigation Title", isOn: $titleOn)
                        .padding(.vertical, 4)
                    
                    if titleOn {
                        Text("Navigation title enabled")
                            .foregroundColor(.gray)
                            .padding(.top, 4)
                    }
                }
            }
            .navigationTitle("Настройки")
        }
    }
}

#Preview {
    SettingsView()
}
