//
//  ViewDidLoadModifier.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 27/07/24.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    
    @State private var viewDidLoad: Bool = false
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
