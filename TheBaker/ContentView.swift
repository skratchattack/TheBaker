//
//  ContentView.swift
//  TheBaker
//
//  Created by Orri Arnórsson on 11.1.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ListOfRecipesView()
                .tabItem { Image(systemName: "book") }
        }
    }
}

#Preview {
    ContentView()
}
