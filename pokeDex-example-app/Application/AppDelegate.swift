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

    var window: UIWindow?

    // MARK: - UIApplicationDelegate methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AKFonts.registerFonts()
        
        window?.rootViewController = SplashRootVC()
        window?.makeKeyAndVisible()
        return true
    }
}

