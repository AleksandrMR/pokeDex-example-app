//
//  AKIcons.swift
//  
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI

public enum AKIcons: String {
    case arrowRight
    case arrowLeft
    case pokPlaceholder
}

// MARK: - Extension
public extension AKIcons {
    var icon: Image {
        Image(rawValue, bundle: .module)
    }
    
    var uiIcon: UIImage? {
        UIImage(named: rawValue, in: .module, with: nil)
    }
}
