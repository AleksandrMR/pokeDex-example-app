//
//  UIViewExtension.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 24/07/24.
//

import SwiftUI

extension UIView {
    
    @discardableResult
    func pinTo(top: NSLayoutYAxisAnchor,
               leading: NSLayoutXAxisAnchor,
               bottom: NSLayoutYAxisAnchor,
               trailing: NSLayoutXAxisAnchor) -> (top: NSLayoutConstraint,
                                                  leading: NSLayoutConstraint,
                                                  bottom: NSLayoutConstraint,
                                                  trailing: NSLayoutConstraint)? {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = (
            top: topAnchor.constraint(equalTo: top),
            leading: leadingAnchor.constraint(equalTo: leading),
            bottom: bottomAnchor.constraint(equalTo: bottom),
            trailing: trailingAnchor.constraint(equalTo: trailing)
        )
        NSLayoutConstraint.activate([constraints].flatMap({ [$0, $1, $2, $3] }))
        return constraints
    }
    
    @discardableResult
    func pinToSuperview() -> (top: NSLayoutConstraint,
                              leading: NSLayoutConstraint,
                              bottom: NSLayoutConstraint,
                              trailing: NSLayoutConstraint)? {
        guard let superview = superview else { return nil }
        return pinTo(top: superview.topAnchor,
                     leading: superview.leadingAnchor,
                     bottom: superview.bottomAnchor,
                     trailing: superview.trailingAnchor)
    }
    
    func removeAllSubviews() {
        subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}
