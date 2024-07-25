//
//  CKListItem1.swift
//
//
//  Created by Aleksandr Milashevski on 25/07/24.
//

import SwiftUI
import AssetKit

public struct CKListItem1: View {
    
    // MARK: - Let
    private let title: String
    private let imgPath: String
    private let action: ()->()
    
    // MARK: - Initialization func
    public init(title: String, imgPath: String, action: @escaping () -> Void) {
        self.title = title
        self.imgPath = imgPath
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
        Button {
            action()
        } label: {
            itemLabel
        }
    }
}

// MARK: - Extensions
extension CKListItem1 {
    @ViewBuilder var itemLabel: some View {
        HStack {
            AsyncImage(url: URL(string: imgPath)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100, alignment: .center)
            Spacer()
            Text(title)
                .font(AKFonts.pokemonClassic(16).font)
                .foregroundColor(AKColors.blue3b4cca.color)
        }
        .background(AKColors.yellowffde00.color)
    }
}

// MARK: - Preview
#Preview {
    CKListItem1(
        title: "PokemonListSC",
        imgPath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/18.png",
        action: { }
    )
}
