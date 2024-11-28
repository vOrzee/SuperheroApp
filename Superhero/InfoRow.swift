//
//  InfoRow.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct InfoRow: View {
    
    let url: URL?
    let cacheKey: String
    let name: String
    
    var body: some View {
        HStack {
            if let url = url {
                CachedAsyncImage(url: url, cacheKey: cacheKey)
                    .frame(width: 50, height: 50)
                    .cornerRadius(16.0)
                    .padding(.trailing, 8.0)
            } else {
                Image(uiImage: UIImage(named: "Placeholder")!)
                    .frame(width: 50, height: 50)
                    .cornerRadius(16.0)
                    .padding(.trailing, 8.0)
            }
            Text(name)
                .lineLimit(1)
                .truncationMode(.tail)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
