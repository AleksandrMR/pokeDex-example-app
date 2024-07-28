//
//  PokemonDetailsCoordinator.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 25/07/24.
//

import UIKit
import Logger

class PokemonDetailsCoordinator: Coordinator {
    
    // MARK: - Var
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initialization func
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        Logger.shared.printLog(AppStrings.Log.pokemonDetailsCoordinatorDeinit, logType: .info, .message)
    }
    
    // MARK: - Flow funcs
    func start() {
        Logger.shared.printLog(AppStrings.Log.pokemonDetailsCoordinatorStart, logType: .info, .message)
        goToDetailsVC()
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - Extensions
private extension PokemonDetailsCoordinator {
    func goToDetailsVC() {
        let vm = PokemonDetailsVM.init()
        vm.coordinator = self
        let vc = PokemonDetailsRootVC.init()
        vc.vm = vm
        navigationController.pushViewController(vc, animated: true)
    }
}
