//
//  CKButton1.swift
//
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI
import AssetKit

public struct CKButton1: View {
    
    // MARK: - Let
    let title: String
    let action: ()->()
    
    // MARK: - Initialization func
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
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
    CKButton1(title: "CKButton1") { }
}
