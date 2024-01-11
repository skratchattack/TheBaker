//
//  EditRecipeView.swift
//  TheBaker
//
//  Created by Orri Arnórsson on 11.1.2024.
//

import SwiftUI
import SwiftData

struct EditRecipeView: View {
    @Bindable var recipe: Recipe
    @State private var newIngredient: Ingredient?
    @Environment(\.modelContext) var modelContext

    
    var body: some View {
        Form {
            
            Section("Ingredients") {
                ForEach(recipe.ingredient) { ingredient in
                    Text(ingredient.name)
                }
            }
            .navigationTitle($recipe.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func addNewIngredient() {
        let ingredient: Ingredient
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Recipe.self, configurations: config)
        let example = Recipe(title: "Bread", ingredient: [
            Ingredient(name: "Flour", amount: 1000, unit: "g", comment: "sifted"),
            Ingredient(name: "Water", amount: 700, unit: "g", comment: "boiled"),
            Ingredient(name: "Salt", amount: 20, unit: "g"),
            Ingredient(name: "Yeast", amount: 10, unit: "g")
        ])
        return EditRecipeView(recipe: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
    
}
