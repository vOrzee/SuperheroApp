//
//  Biography.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

struct Biography: Codable, Equatable {
    let fullName: String?
    let alterEgos: String?
    let aliases: [String?]?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?
}
