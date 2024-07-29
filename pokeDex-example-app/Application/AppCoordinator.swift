//
//  AppCoordinator.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import UIKit
import Logger
import Networking

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    
    // MARK: - private Let
    private let apiClient: ApiProtocol
    
    // MARK: - Var
    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Initialization func
    init(navigationController: UINavigationController, apiClient: ApiProtocol) {
        self.navigationController = navigationController
        self.apiClient = apiClient
    }
    
    deinit {
        Logger.shared.printLog(AppStrings.Log.appCoordinatorDeinit, logType: .info, .message)
    }
    
    // MARK: - Flow funcs
    func start() {
        Logger.shared.printLog(AppStrings.Log.appCoordinatorStart, logType: .info, .message)
        initSplashCoordinator()
    }
    
    // MARK: - Flow private funcs
    private func initSplashCoordinator() {
        let splashCoordinator = SplashCoordinator.init(navigationController: navigationController, apiClient: apiClient)
        splashCoordinator.parentCoordinator = self
        children.append(splashCoordinator)
        splashCoordinator.start()
    }
}
