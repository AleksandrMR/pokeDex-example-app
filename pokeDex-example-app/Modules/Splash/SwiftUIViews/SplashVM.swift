//
//  SplashVM.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

class SplashVM: ObservableObject {
    
    // MARK: - Var
    weak var coordinator: SplashCoordinator?
    
    // MARK: - Flow funcs
    func goToHome() {
        coordinator?.goToHome()
    }
}
