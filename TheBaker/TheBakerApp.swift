//
//  TheBakerApp.swift
//  TheBaker
//
//  Created by Orri Arnórsson on 11.1.2024.
//

import SwiftData
import SwiftUI

@main
struct TheBakerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Recipe.self)
    }
}
