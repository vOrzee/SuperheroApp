//
//  HeroesRepositoryProtocol.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import Foundation

@MainActor
protocol HeroesRepositoryProtocol: ObservableObject {
    var heroes: [Hero] { get }
    var isLoading: Bool { get }
    var error: AppError? { get }

    func fetchHeroes() async
    func fetchHero(byId id: Int) async -> Hero?
}
