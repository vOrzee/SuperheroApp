//
//  Powerstats.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

struct Powerstats: Codable, Equatable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
    
    func asArray() -> [(title: String, value: Int)] {
        return [
            ("Интеллект", intelligence),
            ("Сила", strength),
            ("Скорость", speed),
            ("Выносливость", durability),
            ("Мощь", power),
            ("Бой", combat)
        ]
    }
}
