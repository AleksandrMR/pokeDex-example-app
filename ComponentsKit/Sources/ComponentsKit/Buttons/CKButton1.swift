//
//  CKButton1.swift
//
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI
import AssetKit

public struct CKButton1: View {
    
    public enum IconPosition {
        case left
        case right
    }
    
    // MARK: - Let
    private let iconPosition: IconPosition
    private let title: String
    private let action: ()->()
    
    // MARK: - Initialization func
    public init(iconPosition: IconPosition, title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.iconPosition = iconPosition
    }
    
    // MARK: - Body
    public var body: some View {
        Button {
            action()
        } label: {
            switch iconPosition {
            case .left:
                btnLabelWithLeftIcon
            case .right:
                btnLabelWithRightIcon
            }
        }
        .buttonStyle(Button1Style())
    }
}

// MARK: - Extensions
private extension CKButton1 {
    @ViewBuilder var btnLabelWithRightIcon: some View {
        HStack {
            Text(title)
            Spacer()
            AKIcons.arrowRight.icon
                .resizable()
                .scaledToFit()
                .frame(height: 20)
        }
    }
    
    @ViewBuilder var btnLabelWithLeftIcon: some View {
        HStack {
            AKIcons.arrowLeft.icon
                .resizable()
                .scaledToFit()
                .frame(height: 20)
            Spacer()
            Text(title)
        }
    }
}

// MARK: - Preview
#Preview {
    CKButton1(iconPosition: .right, title: "CKButton1") { }
}
