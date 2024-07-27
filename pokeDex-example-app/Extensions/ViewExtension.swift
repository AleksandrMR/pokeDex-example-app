//
//  ViewExtension.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 27/07/24.
//

import SwiftUI

extension View {
    
    // MARK: - Lifecycle funcs
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
