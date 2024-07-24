//
//  AKFonts.swift
//
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI


public enum FontFamily: String {
    case pokemonClassic = "Pokemon-Classic"
}

public enum AKFonts {
    case pokemonClassic(CGFloat)
}

// MARK: - Extension
public extension AKFonts {
    var font: Font {
        switch self {
        case .pokemonClassic(let size):
            return .custom(FontFamily.pokemonClassic.rawValue, size: size)
        }
    }
    
    var uiFont: UIFont? {
        switch self {
        case .pokemonClassic(let size):
            return UIFont(name: FontFamily.pokemonClassic.rawValue, size: size)
        }
    }
}

// MARK: - Extension for Register Fonts
extension AKFonts {
    private static var fonts = [
        (name: "Pokemon-Classic", extension: ".ttf")
    ]
    
    public static func registerFonts() {
        for font in AKFonts.fonts {
            guard let fontURL = Bundle.module.url(forResource: font.name, withExtension: font.extension),
                  let provider = CGDataProvider(url: fontURL as CFURL),
                  let font = CGFont(provider)
            else { return }
            var error: Unmanaged<CFError>?
            CTFontManagerRegisterGraphicsFont(font, &error)
        }
    }
}
