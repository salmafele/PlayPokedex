//
//  API.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

let base = "https://pokeapi.co/api/v2"

enum API {
    case pokemon(Int)
    var endPoint: String {
        switch self {
        case .pokemon(let id): return "\(base)/pokemon/\(id)/"
        }
    }
}
