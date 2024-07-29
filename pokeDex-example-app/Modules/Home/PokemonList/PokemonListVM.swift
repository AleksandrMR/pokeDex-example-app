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
    
    // MARK: - private Let
    private let networkDataProvider: IPokemonDataProvider
    
    // MARK: - Published var
    @Published var pokemonList: [Pokemon] = []
    
    // MARK: - private Var
    private var cancellables: Set<AnyCancellable> = []
    private weak var coordinator: IHomeCoordinator?
    
    // MARK: - Initialization func
    init(
        coordinator: IHomeCoordinator,
        pokemonDataProvider: IPokemonDataProvider
    ) {
        self.coordinator = coordinator
        self.networkDataProvider = pokemonDataProvider
        listenOnPublishers()
    }
    
    // MARK: - Flow funcs
    func goToPokemonDetails() {
        coordinator?.initPokemonDetailsCoordinator()
    }
    
    // MARK: - Flow private funcs
    private func listenOnPublishers() {
        networkDataProvider.pokemonListPublisher
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
        networkDataProvider.getPokemonList()
    }
    
    @MainActor
    func getPokemonDetails(id: Int) {
        networkDataProvider.getPokemonDetails(id: id)
        goToPokemonDetails()
    }
}
