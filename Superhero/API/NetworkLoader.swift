//
//  NetworkLoader.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import Foundation

class NetworkLoader: NetworkLoaderProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler(data, response, error)
        }
    }
}
