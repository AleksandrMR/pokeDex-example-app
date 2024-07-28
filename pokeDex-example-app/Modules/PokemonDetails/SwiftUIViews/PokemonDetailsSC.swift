//
//  PokemonDetailsSC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import AssetKit
import ComponentsKit

struct PokemonDetailsSC: View {
    
    // MARK: - Var
    @StateObject var vm: PokemonDetailsVM
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            header
            infoSection
        }
        .ignoresSafeArea()
        .background(AKColors.yellowffde00.color)
    }
}

// MARK: - Extensions
private extension PokemonDetailsSC {
    @ViewBuilder var header: some View {
        ImageWithParallax(imgPath: vm.pokemon?.imgPath ?? AppStrings.noData)
    }
    
    @ViewBuilder var infoSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text(vm.pokemon?.name.uppercased() ?? AppStrings.noData)
                    .font(AKFonts.pokemonClassic(22).font)
                    .foregroundColor(AKColors.yellowffde00.color)
                Spacer()
            }
            Spacer()
            CKListItem2(title: AppStrings.PokemonDetails.pokTypeTitle,
                        value: vm.pokemon?.details.type ?? AppStrings.noData)
            CKListItem2(title: AppStrings.PokemonDetails.pokHeightTitle,
                        value: vm.pokemon?.details.height ?? AppStrings.noData)
            CKListItem2(title: AppStrings.PokemonDetails.pokWeightTitle,
                        value: vm.pokemon?.details.weight ?? AppStrings.noData)
            Spacer()
            CKButton1(iconPosition: .left, title: AppStrings.PokemonDetails.btnGoBack) {
                vm.goBack()
            }
            .padding(.top, 25)
            .padding(.bottom, 44)
            Spacer()
        }
        .padding(.top, 25)
        .padding(.horizontal)
        .background(AKColors.blue3b4cca.color)
        .cornerRadius(20)
    }
}

// MARK: - Preview
#Preview {
    PokemonDetailsSC(vm: PokemonDetailsVM())
}
