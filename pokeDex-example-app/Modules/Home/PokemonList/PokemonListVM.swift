//
//  PokemonListVM.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import Combine
import Networking
import Logger

class PokemonListVM: ObservableObject {
    
    // MARK: - Var
    weak var coordinator: HomeCoordinator?
    
    // MARK: - Published var
    @Published var pokemonList: [Pokemon] = []
    
    // MARK: - private Var
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initialization func
    init() {
        listenOnPublishers()
    }
    
    // MARK: - Flow funcs
    func goToPokemonDetails() {
        coordinator?.initPokemonDetailsCoordinator()
    }
    
    // MARK: - Flow private funcs
    private func listenOnPublishers() {
        PokemonManager.shared.$pokemonList
            .sink { list in
                self.pokemonList = list
            }
            .store(in: &cancellables)
    }
}

// MARK: - Extensions
extension PokemonListVM {

    @MainActor
    func getPokemonList() {
        PokemonManager.shared.getPokemonList()
    }
    
    @MainActor
    func getPokemonDetails(id: Int) {
        PokemonManager.shared.getPokemonDetails(id: id)
        goToPokemonDetails()
    }
}
