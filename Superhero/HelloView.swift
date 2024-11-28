//
//  HelloView.swift
//  Superhero
//
//  Created by Роман Лешин on 28.11.2024.
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        NavigationView {
            Text("Hello world")
                .font(.title)
                .padding()
                .navigationTitle("Приветствие")
        }
    }
}

#Preview {
    HelloView()
}
