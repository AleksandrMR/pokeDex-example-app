//
//  PokemonDetailsCoordinator.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 25/07/24.
//

import UIKit
import Logger
import Networking

protocol IPokemonDetailsCoordinator: AnyObject {
    func goBack()
}

class PokemonDetailsCoordinator: Coordinator, IPokemonDetailsCoordinator {
    
    // MARK: - private Let
    private let dataProvider: IPokemonDataProvider
    
    // MARK: - Var
    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initialization func
    init(navigationController : UINavigationController, dataProvider: IPokemonDataProvider) {
        self.navigationController = navigationController
        self.dataProvider = dataProvider
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
        let vm = PokemonDetailsVM.init(coordinator: self, pokemonDataProvider: dataProvider)
        let vc = PokemonDetailsRootVC.init()
        vc.vm = vm
        navigationController.pushViewController(vc, animated: true)
    }
}
