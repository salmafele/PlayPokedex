//
//  Pokemon.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

struct PokemonData: Codable {

    var name: String!
    var pokedexId: Int!
    var description: String?
    var type: String?
    var defense: String?
    var height: String?
    var weight: String?
    var attack: String?
    var nextEvolutionText: String?

}
