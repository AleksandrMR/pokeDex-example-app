//
//  HomeCoordinator.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import UIKit
import Networking
import Logger


protocol IHomeCoordinator: AnyObject {
    func initPokemonDetailsCoordinator()
}

class HomeCoordinator: Coordinator, IHomeCoordinator {
    
    // MARK: - private Let
    private let apiClient: ApiProtocol
    private let dataProvider: IPokemonDataProvider
    
    // MARK: - Var
    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initialization func
    init(navigationController : UINavigationController, apiClient: ApiProtocol) {
        self.navigationController = navigationController
        self.apiClient = apiClient
        self.dataProvider = PokemonManager(apiClient: self.apiClient)
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
        let pokemonDetailsCoordinator = PokemonDetailsCoordinator.init(navigationController: navigationController, dataProvider: dataProvider)
        pokemonDetailsCoordinator.parentCoordinator = self
        children.append(pokemonDetailsCoordinator)
        pokemonDetailsCoordinator.start()
    }
}

// MARK: - Extensions
private extension HomeCoordinator {
    func goToHomeVC() {
        let vm = PokemonListVM.init(coordinator: self, pokemonDataProvider: dataProvider)
        let vc = HomeRootVC()
        vc.vm = vm
        navigationController.pushViewController(vc, animated: true)
    }
}
