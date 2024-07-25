//
//  HomeCoordinator.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import UIKit
import Logger

class HomeCoordinator: Coordinator {
    
    // MARK: - Var
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initialization func
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        Logger.shared.printLog(AppStrings.Log.homeCoordinatorDeinit, logType: .info, .message)
    }
    
    // MARK: - Flow funcs
    func start() {
        Logger.shared.printLog(AppStrings.Log.homeCoordinatorStart, logType: .info, .message)
        goToHomeVC()
    }
    
    func initPokemonDetailsCoordinator() {
        let pokemonDetailsCoordinator = PokemonDetailsCoordinator.init(navigationController: navigationController)
        pokemonDetailsCoordinator.parentCoordinator = self
        children.append(pokemonDetailsCoordinator)
        pokemonDetailsCoordinator.start()
    }
    
    // MARK: - Flow private funcs
    private func goToHomeVC() {
        let vm = PokemonListVM.init()
        vm.coordinator = self
        let vc = HomeRootVC()
        vc.vm = vm
        navigationController.pushViewController(vc, animated: true)
    }
}
