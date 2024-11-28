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
                CachedAsyncImage(url: URL(string: hero.images.sm) ?? URL(string: "https://play-lh.googleusercontent.com/dTIaYyKOw2-DD1DGU7jKFhgZXPuEyHGSFEwE_xpWSCSSAii9Jwu8JstmSd1m3VowsNUj")!, cacheKey: "\(hero.id)-md")
                    .frame(width: 200, height: 200)
                    .cornerRadius(24.0)
                    .shadow(radius: 10)

                    Text(hero.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center) // Выравнивание по центру

                    Text("Приверженность: \(hero.biography.alignment ?? "Неизвестно")")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    // Дополнительная информация
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
