//
//  ButtonStyles.swift
//
//
//  Created by Aleksandr Milashevski on 25/07/24.
//

import SwiftUI
import AssetKit

struct Button1Style: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AKFonts.pokemonClassic(15).font)
            .padding()
            .foregroundColor(AKColors.redcc0000.color)
            .background(AKColors.yellowffde00.color)
            .cornerRadius(12)
    }
}
