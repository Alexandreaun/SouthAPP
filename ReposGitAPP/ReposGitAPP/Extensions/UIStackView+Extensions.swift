//
//  UIStackView+Extensions.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 10/04/21.
//

import UIKit

extension UIStackView {
    func addSpace(height: CGFloat? = nil, width: CGFloat? = nil, backgroundColor: UIColor? = nil) {
        let space = UIView()
        if let _height = height {
            space.heightAnchor.constraint(equalToConstant: _height).isActive = true
            space.backgroundColor = backgroundColor ?? .clear
        }
        if let _width = width {
            space.heightAnchor.constraint(equalToConstant: _width).isActive = true
            space.backgroundColor = backgroundColor ?? .clear
        }
        self.addArrangedSubview(space)
    }
}
