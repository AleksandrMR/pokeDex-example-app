//
//  SplashSC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import AssetKit
import ComponentsKit

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
private extension SplashSC {
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
        CKButton1(iconPosition: .right, title: AppStrings.Splash.btnGoToApp) {
            vm.goToHome()
        }
        .padding([.bottom, .horizontal], 25)
    }
}

// MARK: - Preview
#Preview {
    SplashSC(vm: SplashVM())
}
