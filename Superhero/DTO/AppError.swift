//
//  AppError.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

enum AppError: Error, Equatable {
    case networkUnavailable(String = "")
    case unauthorized
    case dataNotFound
    case unknownError
    case decodingError(String)
}
