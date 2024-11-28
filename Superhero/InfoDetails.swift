//
//  InfoDetails.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct InfoDetails: View {
    
    let hero: Hero
    
    var body: some View {
        ScrollView {
            VStack {
                if let url = URL(string: hero.images.md) {
                    CachedAsyncImage(url: url, cacheKey: "\(hero.id)-md")
                        .frame(width: 200, height: 200)
                        .cornerRadius(24.0)
                        .shadow(radius: 10)
                } else {
                    Image(uiImage: UIImage(named: "Placeholder")!)
                        .frame(width: 200, height: 200)
                        .cornerRadius(24.0)
                        .shadow(radius: 10)
                }
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text("Приверженность: \(hero.biography.alignment ?? "Неизвестно")")
                    .font(.headline)
                    .foregroundColor(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Полное имя: \(hero.biography.fullName ?? "Неизвестно")")
                    Text("Место рождения: \(hero.biography.placeOfBirth ?? "Неизвестно")")
                    Text("Издатель: \(hero.biography.publisher ?? "Неизвестно")")
                }
                .font(.body)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
