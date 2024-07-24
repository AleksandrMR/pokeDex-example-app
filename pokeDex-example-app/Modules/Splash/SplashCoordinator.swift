//
//  SplashCoordinator.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import UIKit
import Logger

class SplashCoordinator: Coordinator {
    
    // MARK: - Var
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initialization func
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        Logger.shared.printLog(AppStrings.Log.splashCoordinatorDeinit, logType: .info, .message)
    }
    
    // MARK: - Flow funcs
    func start() {
        Logger.shared.printLog(AppStrings.Log.splashCoordinatorStart, logType: .info, .message)
        goToSplashVC()
    }
    
    // MARK: - Flow private funcs
    private func goToSplashVC() {
        navigationController.pushViewController(SplashRootVC(), animated: true)
    }
}
