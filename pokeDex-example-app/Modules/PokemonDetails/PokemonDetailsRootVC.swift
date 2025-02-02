//
//  PokemonDetailsRootVC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 25/07/24.
//

import SwiftUI

class PokemonDetailsRootVC: AppViewController {
    
    // MARK: - Var
    var vm: PokemonDetailsVM?
    
    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView()
    }
    
    // MARK: - Flow private funcs
    private func setupSwiftUIView() {
        guard let vm = self.vm else { return }
        let contentView = UIHostingController(rootView: PokemonDetailsSC(vm: vm))
        embedSwiftUIView(contentView)
    }
}
