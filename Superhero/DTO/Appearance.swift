//
//  Appearance.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

struct Appearance: Codable, Equatable {
    let gender: String
    let race: String?
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String
}
