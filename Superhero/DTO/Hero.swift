//
//  Hero.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

struct Hero: Codable, Equatable {
    let id: Int
    let name: String
    let slug: String?
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}
