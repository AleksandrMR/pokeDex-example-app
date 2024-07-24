//
//  SplashSC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import AssetKit

struct SplashSC: View {
    
    // MARK: - Var
    @StateObject var vm: SplashVM
    
    // MARK: - Body
    var body: some View {
        VStack {
            appName
            pokeBall
            btnGoToApp
        }
        .background(AKColors.blue3b4cca.color)
    }
}

// MARK: - Extensions
extension SplashSC {
    @ViewBuilder var appName: some View {
        Text(AppStrings.appName)
            .font(AKFonts.pokemonClassic(35).font)
            .foregroundColor(AKColors.yellowffde00.color)
            .frame(alignment: .leading)
            .padding()
    }
    
    @ViewBuilder var pokeBall: some View {
        AKImages.pokeBall.image
            .resizable()
            .scaledToFill()
    }
    
    @ViewBuilder var btnGoToApp: some View {
        Button {
            vm.goToHome()
        } label: {
            Text(AppStrings.Splash.btnGoToApp)
                .font(AKFonts.pokemonClassic(15).font)
            AKIcons.arrowRight.icon
                .resizable()
                .scaledToFit()
                .frame(height: 20)
        }
        .padding()
        .foregroundColor(AKColors.redcc0000.color)
        .background(AKColors.yellowffde00.color)
        .cornerRadius(12)
    }
}

// MARK: - Preview
#Preview {
    SplashSC(vm: SplashVM())
}
