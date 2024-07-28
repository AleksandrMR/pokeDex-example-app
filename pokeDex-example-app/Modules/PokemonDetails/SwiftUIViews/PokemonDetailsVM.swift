//
//  PokemonDetailsVM.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import Combine

class PokemonDetailsVM: ObservableObject {
    
    // MARK: - Var
    weak var coordinator: PokemonDetailsCoordinator?
    @Published var pokemon: Pokemon?
    
    // MARK: - private Var
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initialization func
    init() {
        listenOnPublishers()
    }
    
    // MARK: - Flow funcs
    func goBack() {
        coordinator?.goBack()
    }
    
    // MARK: - Flow private funcs
    private func listenOnPublishers() {
        PokemonManager.shared.$selectedPokemon
            .sink { value in
                self.pokemon = value
            }
            .store(in: &cancellables)
    }
}
