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
            List (1..<100) { item in
                CKListItem1(title: "PokemonListSC",
                            imgPath: vm.getPokImagePath(id: item)) {
                    vm.goToPokemonDetails()
                }
                .listRowSeparator(.hidden)
                .listRowBackground(AKColors.yellowffde00.color)
            }
            .listRowSpacing(3)
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
            .listStyle(PlainListStyle())
        }
        .background(AKColors.redcc0000.color)
    }
}

// MARK: - Preview
#Preview {
    PokemonListSC(vm: PokemonListVM())
}
