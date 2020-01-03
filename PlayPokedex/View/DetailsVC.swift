//
//  DetailsVC.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var pokemonInfo: UIView!
    @IBOutlet weak var pokemonEvolution: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            pokemonEvolution.isHidden = true
            pokemonInfo.isHidden = false
        case 1:
            pokemonEvolution.isHidden = false
            pokemonInfo.isHidden = true
        default:
            break;
        }
    }
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokeID: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    
    var myPokemon: PokemonData!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainImage.image = UIImage(named: "\(myPokemon.pokedexId!)")
        bioLabel.text = myPokemon.name.capitalized
//        myPokemon.getDetails {
//            self.updateUI() // to update and show each pokemon's details
//        }
    }
    
    func updateUI(){
        pokeID.text = "\(myPokemon.pokedexId!)"
        weightLabel.text = myPokemon.weight
        heightLabel.text = myPokemon.height
        typeLabel.text = myPokemon.type
        attackLabel.text = myPokemon.attack
        defenseLabel.text = myPokemon.defense
    }
    
    
    // MARK: Pokemon info
    
    
    // MARK: Pokemon Evolution
    
    
}
