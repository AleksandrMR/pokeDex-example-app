//
//  PokemonListSC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import AssetKit
import ComponentsKit

struct PokemonListSC: View {
    
    // MARK: - Var
    @StateObject var vm: PokemonListVM
    
    // MARK: - Body
    var body: some View {
        VStack {
            List(vm.pokemonList, id: \.self) { item in
                CKListItem1(title: item.name,
                            imgPath: item.imgPath) {
                    vm.getPokemonDetails(id: item.id)
                }
                            .listRowSeparator(.hidden)
                            .listRowBackground(AKColors.yellowffde00.color)
                            .onAppear {
                                if item.id == vm.pokemonList.endIndex - 20 {
                                    vm.getPokemonList()
                                }
                            }
            }
            .listRowSpacing(3)
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
            .listStyle(.plain)
        }
        .background(AKColors.redcc0000.color)
        .onViewDidLoad {
            vm.getPokemonList()
        }
    }
}

// MARK: - Preview
#Preview {
    PokemonListSC(vm: PokemonListVM())
}
