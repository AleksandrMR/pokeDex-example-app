//
//  AppNavController.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 25/07/24.
//

import UIKit

class AppNavController: UINavigationController {

    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Flow funcs
    func setNavBar(isHidden: Bool) {
        navigationBar.isHidden = isHidden
    }
}
