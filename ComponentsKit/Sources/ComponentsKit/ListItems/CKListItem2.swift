//
//  CKListItem2.swift
//
//
//  Created by Aleksandr Milashevski on 28/07/24.
//

import SwiftUI
import AssetKit

public struct CKListItem2: View {
    
    // MARK: - private Let
    private let title: String
    private let value: String
    
    // MARK: - Initialization func
    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    // MARK: - Body
    public var body: some View {
        HStack {
            Text(title)
                .foregroundColor(AKColors.white.color)
                .font(AKFonts.pokemonClassic(16).font)
            Text(value)
                .foregroundColor(AKColors.yellowffde00.color)
                .font(AKFonts.pokemonClassic(18).font)
        }
    }
}

// MARK: - Preview
#Preview {
    CKListItem2(title: "Title", value: "Value")
}
