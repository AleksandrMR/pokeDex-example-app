//
//  AppStrings.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import Foundation

struct AppStrings {
    
    static let appName = "PokeDex App"
    static let noData = "no data"

    struct Splash {
        static let btnGoToApp = "Go to App"
    }
    
    struct PokemonDetails {
        static let btnGoBack = "Go Back"
        static let pokTypeTitle = "Type - "
        static let pokHeightTitle = "Height - "
        static let pokWeightTitle = "Weight - "
    }
    
    struct Log {
        static let appCoordinatorStart = "AppCoordinator Start"
        static let appCoordinatorDeinit = "AppCoordinator Deinit"
        static let splashCoordinatorStart = "SplashCoordinator Start"
        static let splashCoordinatorDeinit = "SplashCoordinator Deinit"
        static let homeCoordinatorStart = "HomeCoordinator Start"
        static let homeCoordinatorDeinit = "HomeCoordinator Deinit"
        static let pokemonDetailsCoordinatorStart = "PokemonDetailsCoordinator Start"
        static let pokemonDetailsCoordinatorDeinit = "PokemonDetailsCoordinator Deinit"
        static let appViewController = "AppViewController Deinit"
    }
}
