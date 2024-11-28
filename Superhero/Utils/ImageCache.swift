//
//  ImageCaches.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()

    private init() {}

    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func getImage(forKey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
}
