//
//  AKColors.swift
//
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI


public enum AKColors: String {
    /// Blue
    case blue3b4cca
    /// Red
    case redcc0000
    case redff0000
    /// Yellow
    case yellowb3a125
    case yellowffde00
    case white
}

public extension AKColors {
    var color: Color {
        Color(rawValue, bundle: .module)
    }
    
    var uiColor: UIColor? {
        UIColor(color)
    }
}
