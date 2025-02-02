//
//  HomeRootVC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

class HomeRootVC: AppViewController {
    
    // MARK: - Var
    var vm: PokemonListVM?

    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupSwiftUIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    // MARK: - Flow private funcs
    private func setupNavigationController() {
        (navigationController as? AppNavController)?.setNavBar(isHidden: true)
    }
    
    private func setupSwiftUIView() {
        guard let vm = self.vm else { return }
        let contentView = UIHostingController(rootView: PokemonListSC(vm: vm))
        embedSwiftUIView(contentView)
    }
}
