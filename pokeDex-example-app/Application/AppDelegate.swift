//
//  AppDelegate.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import UIKit
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
extension AppDelegate {
    private func setupAfterLaunch() {
        AKFonts.registerFonts()
        
        let navController = AppNavController.init()
        appCoordinator = AppCoordinator.init(navigationController: navController)
        appCoordinator?.start()
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
