//
//  AppViewController.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import UIKit

class AppViewController: UIViewController {

    // MARK: - Lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        
    }
    
    // MARK: - Flow funcs
    func embedSwiftUIView(_ hostingViewCtrl: UIViewController) {
        view.removeAllSubviews()
        for child in children {
            child.removeFromParent()
        }
        addChild(hostingViewCtrl)
        view.addSubview(hostingViewCtrl.view)
        hostingViewCtrl.view.pinToSuperview()
        hostingViewCtrl.didMove(toParent: self)
        view.setNeedsLayout()
    }
}
