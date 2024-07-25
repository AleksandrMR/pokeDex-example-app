//
//  PokemonDetailsSC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

struct PokemonDetailsSC: View {
    
    // MARK: - Var
    @StateObject var vm: PokemonDetailsVM
    
    // MARK: - Body
    var body: some View {
        Text("PokemonDetailsSC")
    }
}

// MARK: - Preview
#Preview {
    PokemonDetailsSC(vm: PokemonDetailsVM())
}
