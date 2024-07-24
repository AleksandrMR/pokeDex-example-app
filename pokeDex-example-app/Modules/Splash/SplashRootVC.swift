//
//  SplashRootVC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

class SplashRootVC: AppViewController {
    
    // MARK: - Var
    var vm: SplashVM?

    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView()
    }
    
    // MARK: - Flow private funcs
    private func setupSwiftUIView() {
        guard let vm = self.vm else { return }
        let contentView = UIHostingController(rootView: SplashSC(vm: vm))
        embedSwiftUIView(contentView)
    }
}
