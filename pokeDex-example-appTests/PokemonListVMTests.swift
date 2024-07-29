//
//  PokemonListVMTests.swift
//  pokeDex-example-appTests
//
//  Created by Aleksandr Milashevski on 29/07/24.
//

import XCTest
import Combine
@testable import pokeDex_example_app


final class PokemonListVMTests: XCTestCase {
    
    // MARK: - Var
    var homeCoordinatorMock: IHomeCoordinator!
    
    override func setUp() {
        homeCoordinatorMock = HomeCoordinatorMock()
    }

    // MARK: - Flow funcs
    @MainActor func test_dataAppeared_whenViewShowed() {
        // given
        let pokemons = [
            Pokemon(id: 1, name: "Pokemon1", image: nil, imgPath: "", details: Details()),
            Pokemon(id: 2, name: "Pokemon2", image: nil, imgPath: "", details: Details()),
        ]
        let sut = makeSut(testablePokemons: pokemons)
        
        // when
        sut.getPokemonList()
        
        // then
        let result = sut.pokemonList
        
        XCTAssert(pokemons[0].id == result[0].id)
        XCTAssert(pokemons.count == result.count)
    }
    
    func makeSut(testablePokemons: [Pokemon]) -> PokemonListVM {
        let networkProviderMock = PokemonDataProviderMock()
        networkProviderMock.testableData = testablePokemons
        return PokemonListVM(
            coordinator: homeCoordinatorMock,
            pokemonDataProvider: networkProviderMock
        )
    }
}

class PokemonDataProviderMock: IPokemonDataProvider {
    
    // MARK: - Var
    var testableData = [Pokemon]()
    @Published var listPokemons: [pokeDex_example_app.Pokemon] = []
    @Published var selectedPokemon: pokeDex_example_app.Pokemon?
    
    var selectedPokemonPublisher: AnyPublisher<pokeDex_example_app.Pokemon?, Never> {
        $selectedPokemon.eraseToAnyPublisher()
    }
    
    var pokemonListPublisher: AnyPublisher<[pokeDex_example_app.Pokemon], Never> {
        $listPokemons.eraseToAnyPublisher()
    }
    
    // MARK: - Flow funcs
    func getPokemonList() {
        listPokemons.append(contentsOf: testableData)
    }
    
    func getPokemonDetails(id: Int) {
        selectedPokemon = testableData.first
    }
}

class HomeCoordinatorMock: IHomeCoordinator {
    
    // MARK: - Var
    var initPokemonDetailsCoordinatorTriggered: Bool = false
    
    // MARK: - Flow funcs
    func initPokemonDetailsCoordinator() {
        initPokemonDetailsCoordinatorTriggered = true
    }
}
