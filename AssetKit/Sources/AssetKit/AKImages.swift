//
//  AKImages.swift
//  
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI


public enum AKImages: String {
    case pokeBall
}

// MARK: - Extension
public extension AKImages {
    var image: Image {
        Image(rawValue, bundle: .module)
    }
    
    var uiImage: UIImage? {
        UIImage(named: rawValue, in: .module, with: nil)
    }
}
