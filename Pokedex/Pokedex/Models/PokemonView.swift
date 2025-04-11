//
//  PokemonView.swift
//  Pokedex
//
//  Created by Alex Yang on 11/4/24.
//

import Foundation
import SwiftUI

struct PokemonView: View {
    
    var pokemon: Pokemon
    
    static var example: Pokemon {
            Pokemon(id: 1, num: "001", name: "Bulbasaur", img: "http://www.serebii.net/pokemongo/pokemon/001.png", type: [
                TypeElement(rawValue: "Grass")!,
                TypeElement(rawValue: "Poison")!
            ], height: "0.71 m", weight: "6.9 kg", candy: "Bulbasaur Candy", candyCount: 25, egg: Egg(rawValue: "2 km")!, spawnChance: 0.69, avgSpawns: 69, spawnTime: "20.00", multipliers: [1.58], weaknesses: [
                TypeElement(rawValue:"Fire")!,
                TypeElement(rawValue:"Ice")!,
                TypeElement(rawValue:"Flying")!,
                TypeElement(rawValue: "Psychic")!
              ], nextEvolution: [
              Evolution(num: "002", name: "Ivysaur"),
              Evolution(num: "003", name: "Venusaur")
              ], prevEvolution: nil)
        }
    
    var imageURL: URL {
        let http = pokemon.img
        let https = "https" + http.dropFirst(4)
        return URL(string: https)!
        }
    
    
    var body: some View {
        
        VStack {
            HStack {
                Text(pokemon.name)
                Text("#\(pokemon.num)")
            }
                .font(.title)
            
            HStack {
                AsyncImage(url: imageURL) { image in image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                        ProgressView()
                    }
                .frame(width: 200)
                
                VStack {
                    Text("Height: \(pokemon.height)")
                    Text("Weight: \(pokemon.weight)")
                }
            }
        }
    }
}


#Preview {
    PokemonView(pokemon: .example)
}
