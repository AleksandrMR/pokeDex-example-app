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
extension PokemonDetailsSC {
    @ViewBuilder var header: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .offset(y: -geometry.frame(in: .global).minY)
                    .frame(width: UIScreen.main.bounds.width,
                           height:  geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + vm.circleHeight : vm.circleHeight)
                    .foregroundColor(AKColors.yellowb3a125.color)
                AsyncImage(url: URL(string: vm.imgPath)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .offset(y: -geometry.frame(in: .global).minY)
                .frame(width: UIScreen.main.bounds.width,
                       height:  geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + vm.headerHeight : vm.headerHeight)
            }
        }
        .frame(height: vm.headerHeight)
    }
    
    @ViewBuilder var infoSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Pokemon Name")
                    .font(AKFonts.pokemonClassic(18).font)
                    .foregroundColor(AKColors.yellowffde00.color)
                Spacer()
            }
            Text("some 3 info about pokemon ...")
                .foregroundColor(.white)
                .font(AKFonts.pokemonClassic(14).font)
            CKButton1(title: AppStrings.PokemonDetails.btnGoBack) {
                vm.goBack()
            }
            .padding(.top, 25)
            Spacer(minLength: UIScreen.main.bounds.height - vm.headerHeight)
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
