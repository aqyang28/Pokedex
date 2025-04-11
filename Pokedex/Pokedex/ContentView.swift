//
//  ContentView.swift
//  Pokedex
//
//  Created by Alex Yang on 10/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var pokedexService = PokedexService()
    private var pokemonList = PokedexService.shared.pokemon
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemonList) { pokemon in
                    NavigationLink(pokemon.name) {
                        PokemonView(pokemon: pokemon)
                    }
                    //Text("\(pokemon.name)")
                    //Text("\(pokedexService.pokemon.count)")
                    //Text(pokedexService.getPokemonById(id: 3)!.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
