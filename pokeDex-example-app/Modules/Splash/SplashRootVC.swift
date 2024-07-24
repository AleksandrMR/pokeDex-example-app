//
//  SplashRootVC.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 23/07/24.
//

import SwiftUI

class SplashRootVC: AppViewController {

    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView()
    }
    
    // MARK: - Flow funcs
    private func setupSwiftUIView() {
        let contentView = UIHostingController(rootView: SplashSC())
        embedSwiftUIView(contentView)
    }
}
