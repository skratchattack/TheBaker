//
//  ListOfRecipesView.swift
//  TheBaker
//
//  Created by Orri Arnórsson on 11.1.2024.
//

import SwiftData
import SwiftUI

struct ListOfRecipesView: View {
    @Query var recipes: [Recipe]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(value: recipe) {
                        VStack(alignment: .leading) {
                            Text(recipe.title)
                                .font(.headline)
                            
                            Text(recipe.createdAt.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteRecipes)
            }
            .navigationTitle("Recipes")
            
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }
    func addSamples() {
        let frenchChocolateCake = Recipe(title: "French Chocolate Cake", ingredient: [
            Ingredient(name: "Butter", amount: 1000, unit: "g", comment: "boiled"),
            Ingredient(name: "Sugar", amount: 1000, unit: "g"),
            Ingredient(name: "Eggs", amount: 1000, unit: "g", comment: "whole"),
            Ingredient(name: "Flour", amount: 400, unit: "g", comment: "sifted"),
            Ingredient(name: "Chocolate", amount: 1000, unit: "g", comment: "in pieces")])
        
        let carrotCake = Recipe(title: "Carrot Cake", ingredient: [
            Ingredient(name: "Carrots", amount: 1000, unit: "g", comment: "grated"),
            Ingredient(name: "Sugar", amount: 1000, unit: "g"),
            Ingredient(name: "Eggs", amount: 1000, unit: "g", comment: "whole"),
            Ingredient(name: "Flour", amount: 400, unit: "g", comment: "sifted"),
            Ingredient(name: "Raisins", amount: 1000, unit: "g")])
        
        modelContext.insert(frenchChocolateCake)
        modelContext.insert(carrotCake)
    }
    
    func deleteRecipes(_ indexSet: IndexSet) {
        for index in indexSet {
            let recipe = recipes[index]
            modelContext.delete(recipe)
        }
    }
}

#Preview {
    ListOfRecipesView()
}
