//
//  JSONParser.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

public class PokemonParser {
    
        func parse(data: Data, completed: (PokemonData) -> Void) {
        
        // create decoder
        let jsonDecoder = JSONDecoder()
        
        do {
            // decode json into structs
            let pokemonData = try jsonDecoder.decode(PokemonData.self, from: data)
            
            completed(pokemonData)
            
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
    }
}
