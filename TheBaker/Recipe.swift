//
//  Recipe.swift
//  TheBaker
//
//  Created by Orri Arnórsson on 11.1.2024.
//

import Foundation
import SwiftData

@Model
class Ingredient {
    var name: String = ""
    var amount: Double = 0.0
    var unit: String = ""
    var comment: String?
    
    init(name: String, amount: Double, unit: String, comment: String? = nil) {
        self.name = name
        self.amount = amount
        self.unit = unit
        self.comment = comment
    }
}

@Model
class Recipe {
    var title: String
    var ingredient: [Ingredient]
    let createdAt: Date = Date.now
    
    init(title: String, ingredient: [Ingredient]) {
        self.title = title
        self.ingredient = ingredient
    }
}

extension Recipe {
    static var DUMMY_RECIPES: [Recipe] = [
        .init(title: "French Chocolate Cake", ingredient: [
            Ingredient(name: "Butter", amount: 1000, unit: "g", comment: "boiled"),
            Ingredient(name: "Sugar", amount: 1000, unit: "g"), 
            Ingredient(name: "Eggs", amount: 1000, unit: "g", comment: "whole"), 
            Ingredient(name: "Flour", amount: 400, unit: "g", comment: "sifted"), 
            Ingredient(name: "Chocolate", amount: 1000, unit: "g", comment: "in pieces")]),
    ]
}
