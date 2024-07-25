//
//  HomeRootVC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

class HomeRootVC: AppViewController {

    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView()
    }
    
    // MARK: - Flow private funcs
    private func setupSwiftUIView() {
        let vm = PokemonListVM()
        let contentView = UIHostingController(rootView: PokemonListSC(vm: vm))
        embedSwiftUIView(contentView)
    }
}
