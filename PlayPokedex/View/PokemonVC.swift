//
//  PokemonVC.swift
//  PlayPokedex
//
//  Created by Salma on 12/10/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class PokemonVC: UIViewController {

    var myPokemon = [PokemonData]()
    var filteredPokemon = [PokemonData]()
    var isSearching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
                        
            collectionView.delegate = self as UICollectionViewDelegate
            collectionView.dataSource = (self as! UICollectionViewDataSource)
            searchBar.delegate = self as! UISearchBarDelegate
        
        }
}

    func getPokemon(){

        guard let url = URL(string: "https://pokeapi.co/api/v2/") else {
            return
        }
        
        let request = URLRequest(url: url)
        
        // HTTP header part
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            print ("Data: \(String(bytes: data, encoding: .utf8)!)")
            
            let pokemonParser = PokemonParser()
            pokemonParser.parse(data: data) { (pokemonData) in
            }
        }
        task.resume()
    }


extension PokemonVC: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if isSearching {
                return filteredPokemon.count
            }else {
               return myPokemon.count
            }
            
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as? PokemonCell {
            
            if isSearching {
                cell.pokemon = filteredPokemon[indexPath.row]
            }else {
                cell.pokemon = myPokemon[indexPath.row]
            }
            
            return cell
        }else {
            fatalError("Unable to deque PokemonCell")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selected: PokemonData!
        if isSearching {
            selected = filteredPokemon[indexPath.row]
        }else {
            selected = myPokemon[indexPath.row]
        }
        
        performSegue(withIdentifier: "DetailsVC", sender: selected)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsVC" {
            if let destination = segue.destination as? DetailsVC {
                destination.myPokemon = sender as? PokemonData
            }
        }
    }
    
    
    
}


// MARK: Pokemon Cell

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: PokemonData? {
        didSet {
            setupUI()
        }
    }
        func setupUI(){
            layer.cornerRadius = 5.0
            nameLabel.text = pokemon?.name.capitalized
            pokemonImageView.image = UIImage(named: "\(pokemon?.pokedexId ?? 1)")
        }
}



















//
//
////    MARK: CollectionViewDelegate, CollectionViewDataSource, CollectionViewDelegateFlowLayout
//
//extension PokemonVC: CollectionViewDelegate, CollectionViewDataSource, CollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as? PokemonCell {
//            if isSearching {
//                PokemonCell.cell = filteredPokemon[indexPath.row]
//            }else {
//                cell.pokemon = pokemon[indexPath.row]
//            }
//            return cell
//        }else {
//            fatalError("Unable to deque PokemonCell")
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        var selected: PokemonData!
//
//      if isSearching {
//            selected = filteredPokemon[indexPath.row]
//        }else {
//            selected = pokemon[indexPath.row]
//        }
//        performSegue(withIdentifier: "DetailsVC", sender: selected)
//      }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "DetailsVC" {
//            if let destination = segue.destination as? DetailsVC {
//                destination.pokemon = sender as? PokemonData
//            }
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if isSearching {
//            return 0
//        }else {
//            return 1
//        }
//
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 105, height: 110)
//    }
//
//
//}
//
////    MARK: SearchbarDelegate
//extension PokemonVC: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text == nil || searchBar.text == "" {
//            isSearching = false
//            collectionView.reloadData()
//            view.endEditing(true)
//            view.resignFirstResponder()
//        }else {
//            isSearching = true
//
//            guard (searchBar.text?.lowercased()) != nil else { return }
////            filteredPokemon = pokemon.filter { $0.name.range(of: query)}
//            collectionView.reloadData()
//        }
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        view.endEditing(true)
//        view.resignFirstResponder()
//    }
//}
