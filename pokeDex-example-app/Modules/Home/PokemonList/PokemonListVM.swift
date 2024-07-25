//
//  PokemonListVM.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

class PokemonListVM: ObservableObject {
    
    // MARK: - Let
    private let totalPokemons = 1025
    
    // MARK: - Var
    weak var coordinator: HomeCoordinator?
    
    // MARK: - Flow funcs
    func goToPokemonDetails() {
        print("TAP goToPokemonDetails")
        coordinator?.initPokemonDetailsCoordinator()
    }
    
    func getPokImagePath(id: Int) -> String {
        let imagePath = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png"
        return imagePath
    }
}
