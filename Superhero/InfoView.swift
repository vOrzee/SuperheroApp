//
//  InfoView.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject var repository: HeroesRepositoryNetworkImpl
    @AppStorage("titleOn") private var titleOn: Bool = true
    @AppStorage("rowHeight") private var rowHeight: Double = 60.0

    var body: some View {
        NavigationView {
            Group {
                if repository.isLoading {
                    VStack {
                        ProgressView("Загрузка героев...")
                            .progressViewStyle(CircularProgressViewStyle())
                        Text("Пожалуйста, подождите")
                            .foregroundColor(.gray)
                            .padding(.top, 8.0)
                    }
                }
                else if repository.heroes.isEmpty {
                    VStack {
                        Text("Нет данных")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                } else if !repository.heroes.isEmpty {
                    List(repository.heroes, id: \.name) { hero in
                        NavigationLink(destination: InfoDetails(hero: hero)) {
                            InfoRow(
                                url: URL(string: hero.images.sm),
                                cacheKey: "\(hero.id)-sm",
                                name: hero.name
                            )
                            .frame(height: rowHeight)
                        }
                    }
                } else if let error = repository.error {
                    VStack {
                        Text("Ошибка")
                            .font(.headline)
                            .foregroundColor(.red)
                        Text(error.localizedDescription)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.top, 8.0)
                        Button("Повторить") {
                            Task {
                                await repository.fetchHeroes()
                            }
                        }
                        .padding(.top, 8.0)
                    }
                }
                
            }
            .navigationTitle(titleOn ? "Супергерои" : "")
        }
    }
}

#Preview {
    InfoView(repository: HeroesRepositoryNetworkImpl())
}
