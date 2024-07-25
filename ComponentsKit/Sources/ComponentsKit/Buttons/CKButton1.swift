//
//  CKButton1.swift
//
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI
import AssetKit

public struct CKButton1: View {
    
    // MARK: - Let
    private let title: String
    private let action: ()->()
    
    // MARK: - Initialization func
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
        Button {
            action()
        } label: {
            btnLabel
        }
        .buttonStyle(Button1Style())
    }
}

// MARK: - Extensions
extension CKButton1 {
    @ViewBuilder var btnLabel: some View {
        HStack {
            Text(title)
            AKIcons.arrowRight.icon
                .resizable()
                .scaledToFit()
                .frame(height: 20)
        }
    }
}

// MARK: - Preview
#Preview {
    CKButton1(title: "CKButton1") { }
}
