//
//  PokemonListVM.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import Networking
import Logger

class PokemonListVM: ObservableObject {
    
    // MARK: - Let
    private let totalPokemons = 1025
    let apiClient = ApiClient.init()
    
    // MARK: - Var
    weak var coordinator: HomeCoordinator?
    
    // MARK: - Published var
    @Published var pokemonList: [Pokemon] = []
    @Published var apiError: RequestError?
    
    private var idPokemon = 0
    private var requestOffset = 0
    
    // MARK: - Flow funcs
    func goToPokemonDetails() {
        print("TAP goToPokemonDetails")
        coordinator?.initPokemonDetailsCoordinator()
    }
    
    // MARK: - Flow private funcs
    private func savePokemonList(networkModel: PokemonResponse) {
        for item in networkModel.results {
            idPokemon += 1
            let pokemon = Pokemon(id: idPokemon,
                                  name: item.name,
                                  image: nil,
                                  details: nil)
            pokemonList.append(pokemon)
        }
    }
}

// MARK: - Extensions
extension PokemonListVM {
    func getPokImagePath(id: Int) -> String {
        let imagePath = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png"
        return imagePath
    }
    
    @MainActor
    func getPokemonList() {
        let endpoint = PokemonEndpoints.getPokemonList(offset: "\(requestOffset)")
        requestOffset += 100
        Task.init {
            do {
                let list = try await apiClient.sendRequest(endpoint: endpoint, responseModel: PokemonResponse.self)
                savePokemonList(networkModel: list)
            } catch let error as RequestError {
                apiError = error
            }
        }
    }
}
