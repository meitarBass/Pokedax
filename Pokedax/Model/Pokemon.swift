//
//  Pokemon.swift
//  Pokedax
//
//  Created by Meitar Basson on 25/04/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import Foundation

struct Pokemon : Codable {
    
    let name : String
    let order : Int
    let weight : Int
    
    let pokemonMoves : [String]
    let pokemonID : Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case weight
        case order
        
        case pokemonID = "id"
        case pokemonMoves = "moves"
    }
}
