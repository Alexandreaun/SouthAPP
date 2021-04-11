//
//  CustomButton.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 09/04/21.
//

import UIKit

class CustomButton: UIButton {
    
    var widhtBT: CGFloat?
    var heightBT: CGFloat?
    var bkgColorBT: UIColor?
    
    convenience init(widht: CGFloat?, height: CGFloat?, backgroundColor: UIColor?) {
        self.init()
        self.widhtBT = widht
        self.heightBT = height
        self.bkgColorBT = backgroundColor
        configSelfButton()
    }
    
    func configSelfButton() {
        guard let widht = widhtBT, let height = heightBT, let backGround = bkgColorBT else {
            self.widthAnchor.constraint(equalToConstant: 100).isActive = true
            self.heightAnchor.constraint(equalToConstant: 100).isActive = true
            self.backgroundColor = .red
            return
        }
        self.widthAnchor.constraint(equalToConstant: widht).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.backgroundColor = backGround
        setButtonAPP()
    }
    
    func setButtonAPP(){
        self.addTarget(self, action: #selector(colorsBtnTouchUpInside), for: .touchUpInside)
        self.addTarget(self, action: #selector(colorsBtnTouchDown), for: .touchDown)
        self.addTarget(self, action: #selector(colorsBtnTouchUpOutside), for: .touchUpOutside)
        self.titleLabel?.font = UIFont().mainFontApp(size: 25).bold()
        self.setTitleColor(UIColor.black, for: .normal)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.alpha = 0.7
    }
    
    @objc private func colorsBtnTouchUpInside() {
        guard let background = bkgColorBT else {
            self.backgroundColor = .lightGray
            return
        }
        self.backgroundColor = background
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @objc private func colorsBtnTouchDown() {
        guard let background = bkgColorBT else {
            self.backgroundColor = .gray
            return
        }
        self.backgroundColor = background.withAlphaComponent(0.5)
    }
    
    @objc private func colorsBtnTouchUpOutside() {
        guard let background = bkgColorBT else {
            self.backgroundColor = .lightGray
            return
        }
        self.backgroundColor = background
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
}
