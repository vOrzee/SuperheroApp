//
//  HeroesRepositoryNetworkImpl.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//
import Foundation
import SwiftUI

@MainActor
class HeroesRepositoryNetworkImpl: HeroesRepositoryProtocol, ObservableObject {
    @Published private(set) var heroes: [Hero] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var error: AppError?
    
    init() {
        Task {
            await fetchHeroes()
        }
    }

    func fetchHeroes() async {
        isLoading = true
        error = nil
        do {
            heroes = try await fetchHeroesFromNetwork()
            isLoading = false
            await cacheImages(for: heroes)
        } catch let appError as AppError {
            error = appError
        } catch {
            self.error = .unknownError
        }
        isLoading = false
    }

    func fetchHero(byId id: Int) async -> Hero? {
        if let cachedHero = heroes.first(where: { $0.id == id }) {
            return cachedHero
        }
        // На всякий случай
        isLoading = true
        error = nil
        defer { isLoading = false }
        do {
            return try await fetchHeroFromNetwork(id: id)
        } catch let appError as AppError {
            error = appError
            return nil
        } catch {
            self.error = .unknownError
            return nil
        }
    }

    private func fetchHeroesFromNetwork() async throws -> [Hero] {
        return try await withCheckedThrowingContinuation { continuation in
            NetworkManager.getAllHeroes { result in
                switch result {
                case .success(let heroes):
                    continuation.resume(returning: heroes)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchHeroFromNetwork(id: Int) async throws -> Hero {
        return try await withCheckedThrowingContinuation { continuation in
            NetworkManager.getHero(withId: id) { result in
                switch result {
                case .success(let hero):
                    continuation.resume(returning: hero)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func cacheImages(for heroes: [Hero]) async {
        for hero in heroes {
            await cacheImage(from: hero.images.sm, forKey: "\(hero.id)-sm")
            await cacheImage(from: hero.images.md, forKey: "\(hero.id)-md")
        }
    }
    
    private func cacheImage(from urlString: String, forKey key: String) async {
        guard let url = URL(string: urlString), ImageCache.shared.getImage(forKey: key) == nil else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                ImageCache.shared.setImage(image, forKey: key)
            }
        } catch {
            print("Не удалось закешировать изображение \(key): \(error)")
        }
    }
}
