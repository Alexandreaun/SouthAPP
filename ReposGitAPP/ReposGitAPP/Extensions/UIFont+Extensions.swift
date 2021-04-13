//
//  UIFont+Extensions.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 09/04/21.
//

import UIKit

extension UIFont {
     func withTrais(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let ft = fontDescriptor.withSymbolicTraits(traits) else {return self}
        return UIFont(descriptor: ft, size: pointSize)
    }
    
    func bold() -> UIFont {
        return withTrais(traits: .traitBold)
    }
    
    func setFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Não existe esta fonte: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    func mainFontApp(size: CGFloat) -> UIFont {
        return setFont(name: "Thonburi", size: size)
    }
}
