//
//  NetworkManager.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import Foundation

struct NetworkManager {
    
    static var loader: NetworkLoaderProtocol = NetworkLoader()
    static let baseURL = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api"
    
    // Пусть будет
    static func getHero(withId id: Int, completion: @escaping (Result<Hero, AppError>) -> Void) {
        let urlString = "\(baseURL)/id/\(id).json"
        guard let url = URL(string: urlString) else {
            completion(.failure(.networkUnavailable("Invalid URL")))
            return
        }

        loader.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(.networkUnavailable(error.localizedDescription)))
                    return
                }

                guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                    completion(.failure(.networkUnavailable("Invalid response status")))
                    return
                }

                guard let data else {
                    completion(.failure(.dataNotFound))
                    return
                }

                do {
                    let hero = try JSONDecoder().decode(Hero.self, from: data)
                    completion(.success(hero))
                } catch {
                    completion(.failure(.decodingError(error.localizedDescription)))
                }
            }
        }.resume()
    }

    static func getAllHeroes(completion: @escaping (Result<[Hero], AppError>) -> Void) {
        let urlString = "\(baseURL)/all.json"
        guard let url = URL(string: urlString) else {
            completion(.failure(.networkUnavailable("Invalid URL")))
            return
        }
        loader.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(.networkUnavailable(error.localizedDescription)))
                    return
                }

                guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                    completion(.failure(.networkUnavailable("Invalid response status")))
                    return
                }

                guard let data else {
                    completion(.failure(.dataNotFound))
                    return
                }

                do {
                    let heroes = try JSONDecoder().decode([Hero].self, from: data)
                    completion(.success(heroes))
                } catch {
                    completion(.failure(.decodingError(error.localizedDescription)))
                }
            }
        }.resume()
    }
}
