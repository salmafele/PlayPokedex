//
//  PokemonCell.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
        
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
//    var pokemon: PokemonData? {
//        didSet {
//            setupUI()
//        }
//    }
//        
//        func setupUI(){
//            layer.cornerRadius = 5.0
//            nameLabel.text = pokemon?.name.capitalized
//            pokemonImageView.image = UIImage(named: "\(pokemon?.pokedexId ?? 1)")
//        }

}
