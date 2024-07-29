//
//  PokemonDetailsVM.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import Combine

class PokemonDetailsVM: ObservableObject {
    
    // MARK: - private Let
    private let networkDataProvider: IPokemonDataProvider
    
    // MARK: - Published var
    @Published var pokemon: Pokemon?

    // MARK: - private Var
    private var cancellables: Set<AnyCancellable> = []
    private weak var coordinator: IPokemonDetailsCoordinator?
    
    // MARK: - Initialization func
    init(
        coordinator: IPokemonDetailsCoordinator,
        pokemonDataProvider: IPokemonDataProvider
    ) {
        self.coordinator = coordinator
        self.networkDataProvider = pokemonDataProvider
        listenOnPublishers()
    }
    
    // MARK: - Flow funcs
    func goBack() {
        coordinator?.goBack()
    }
    
    // MARK: - Flow private funcs
    private func listenOnPublishers() {
        networkDataProvider.selectedPokemonPublisher
            .sink { value in
                self.pokemon = value
            }
            .store(in: &cancellables)
    }
}
