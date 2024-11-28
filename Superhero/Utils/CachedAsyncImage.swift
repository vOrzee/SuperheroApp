//
//  CachedAsyncImage.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import Foundation
import SwiftUI

struct CachedAsyncImage: View {
    let url: URL
    let cacheKey: String

    @State private var image: UIImage?

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            ProgressView()
                .onAppear {
                    loadImage()
                }
        }
    }

    private func loadImage() {
        if let cachedImage = ImageCache.shared.getImage(forKey: cacheKey) {
            image = cachedImage
            return
        }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let loadedImage = UIImage(data: data) {
                    ImageCache.shared.setImage(loadedImage, forKey: cacheKey)
                    await MainActor.run {
                        image = loadedImage
                    }
                }
            } catch {
                print("Failed to load image: \(error)")
            }
        }
    }
}
