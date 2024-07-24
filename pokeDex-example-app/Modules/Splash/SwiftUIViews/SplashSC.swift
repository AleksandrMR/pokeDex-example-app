//
//  SplashSC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI
import AssetKit

struct SplashSC: View {
    var body: some View {
        VStack {
            Text("PokeDex App")
                .font(AKFonts.pokemonClassic(35).font)
                .foregroundColor(AKColors.yellowffde00.color)
                .frame(alignment: .leading)
                .padding()
            AKImages.pokeBall.image
                .resizable()
                .aspectRatio(contentMode: .fill)
            Button {
                
            } label: {
                Text("Go to App")
                    .font(AKFonts.pokemonClassic(15).font)
                AKIcons.arrowRight.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
            }
            .padding()
            .foregroundColor(AKColors.redcc0000.color)
            .background(AKColors.yellowffde00.color)
            .cornerRadius(12)
       
        }
        .background(AKColors.blue3b4cca.color)
    }
}

#Preview {
    SplashSC()
}
