//
//  PokedexService.swift
//  Pokedex
//
//  Created by Alex Yang on 10/29/24.
//

import Foundation
import SwiftUI

class PokedexService {
    
    static let shared = PokedexService()
    var pokedex: Pokedex
    
    /// Initializer that decodes the Pokedex JSON and stores it in the pokedex variable
    init() {
        // TODO: Write your code here.
        let url: URL = Bundle.main.url(forResource: "pokedex-data", withExtension: "json")!
        let data = try! Data(contentsOf: url)
//        let data = try! Data(contentsOf: Bundle.main.url(forResource: "pokedex-data", withExtension: "json")!)

        let pokedex = try! JSONDecoder().decode(Pokedex.self, from: data)
        
        self.pokedex = pokedex
    }
    
    /// Computed property that returns a list of the pokemon
    var pokemon: [Pokemon] {
        return pokedex.pokemon
    }
        
        /// Function that searches the list of Pokemon for a pokemon with the given id. Returns nil if not found.
        func getPokemonById(id: Int) -> Pokemon? {
            for pkmn in pokedex.pokemon {
                if pkmn.id == id {
                    return pkmn
                }
            }
            return nil
//            return pokemon.first(where: { $0.id == id })

      }
}
