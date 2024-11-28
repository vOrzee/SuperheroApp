//
//  NetworkLoaderProtocol.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import Foundation

protocol NetworkLoaderProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
}
