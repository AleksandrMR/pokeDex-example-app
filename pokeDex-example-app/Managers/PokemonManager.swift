//
//  PokemonManager.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 27/07/24.
//

import SwiftUI
import Networking

class PokemonManager: ObservableObject {
    
    // MARK: - let
    static let shared = PokemonManager()
    
    // MARK: - Let
    let apiClient = ApiClient.init()
    
    // MARK: - Published var
    @Published var pokemonList: [Pokemon] = []
    @Published var apiError: RequestError?
    @Published var selectedPokemon: Pokemon?
    
    // MARK: - private Var
    private var idPokemon = 0
    private var requestOffset = 0
    
    // MARK: - Flow funcs
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
    
    @MainActor
    func getPokemonDetails(id: Int) {
        selectedPokemon = pokemonList.filter { $0.id == id }.first
        let endpoint = PokemonEndpoints.getPokemonDetails(id: "\(id)")
        Task.init {
            do {
                let details = try await apiClient.sendRequest(endpoint: endpoint, responseModel: PokemonDetailsResponse.self)
                savePokemonDetails(networkModel: details)
            } catch let error as RequestError {
                apiError = error
            }
        }
    }
}

// MARK: - Extensions
private extension PokemonManager {
    func getPokImagePath(id: Int) -> String {
        let imagePath = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png"
        return imagePath
    }
    
    func savePokemonList(networkModel: PokemonResponse) {
        for item in networkModel.results {
            idPokemon += 1
            let pokemon = Pokemon(id: idPokemon,
                                  name: item.name,
                                  image: nil,
                                  imgPath: getPokImagePath(id: idPokemon),
                                  details: Details())
            pokemonList.append(pokemon)
        }
    }
    
    func savePokemonDetails(networkModel: PokemonDetailsResponse) {
        selectedPokemon?.details.type = networkModel.types?.first?.type.name ?? "no data"
        selectedPokemon?.details.height = String(networkModel.height)
        selectedPokemon?.details.weight = String(networkModel.weight)
    }
}
