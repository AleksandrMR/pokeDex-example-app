//
//  AppDelegate.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import UIKit
import Networking
import AssetKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Var
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    // MARK: - UIApplicationDelegate methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAfterLaunch()
        return true
    }
}

// MARK: - Extensions
private extension AppDelegate {
    func setupAfterLaunch() {
        AKFonts.registerFonts()
        
        let navController = AppNavController.init()
        let apiClient = ApiClient.init()
        appCoordinator = AppCoordinator.init(navigationController: navController, apiClient: apiClient)
        appCoordinator?.start()
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
