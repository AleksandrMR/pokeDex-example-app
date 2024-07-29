//
//  PokImgPlaceholder.swift
//
//
//  Created by Aleksandr Milashevski on 29/07/24.
//

import SwiftUI
import AssetKit

public struct PokImgPlaceholder: View {
    
    // MARK: - Initialization func
    public init() { }
    
    // MARK: - Body
    public var body: some View {
        AKIcons.pokPlaceholder.icon
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
        
    }
}

// MARK: - Preview
#Preview {
    PokImgPlaceholder()
}
