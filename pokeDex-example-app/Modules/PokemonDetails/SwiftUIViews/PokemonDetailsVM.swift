//
//  PokemonDetailsVM.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

class PokemonDetailsVM: ObservableObject {
    
    let headerHeight: CGFloat = 480
    let circleHeight: CGFloat = 350
    let imgPath = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png"
    
    // MARK: - Var
    weak var coordinator: PokemonDetailsCoordinator?
    
    // MARK: - Flow funcs
    func goBack() {
        coordinator?.goBack()
    }
}
