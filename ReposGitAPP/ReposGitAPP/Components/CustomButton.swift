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
    
   convenience init(widhtBT: CGFloat?, heightBT: CGFloat?, bkgColorBT: UIColor?) {
        self.init()
        self.widhtBT = widhtBT
        self.heightBT = heightBT
        self.bkgColorBT = bkgColorBT
        configSelfButton()
    }
    
    func configSelfButton() {
        guard let widht = self.widhtBT, let height = self.heightBT, let backGround = self.bkgColorBT else {
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
        self.setTitleColor(UIColor.blue, for: .normal)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.alpha = 0.6
    }
    
    @objc private func colorsBtnTouchUpInside() {
        self.backgroundColor = .lightGray
           self.layer.borderWidth = 2
           self.layer.borderColor = UIColor.darkGray.cgColor
       }
    
     @objc private func colorsBtnTouchDown() {
         self.backgroundColor = .gray
     }
     
    @objc private func colorsBtnTouchUpOutside() {
        self.backgroundColor = .lightGray
         self.layer.borderWidth = 2
         self.layer.borderColor = UIColor.darkGray.cgColor
     }
}
 

class CustomButtonCalculate: UIButton {
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        setButtonCalculate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButtonCalculate()
    }
    
    func setButtonCalculate(){
        self.addTarget(self, action: #selector(colorsBtnTouchUpInside), for: .touchUpInside)
        self.addTarget(self, action: #selector(colorsBtnTouchDown), for: .touchDown)
        self.addTarget(self, action: #selector(colorsBtnTouchUpOutside), for: .touchUpOutside)
        self.titleLabel?.font = UIFont().mainFontApp(size: 25)
        self.setTitleColor(UIColor.darkGray, for: .normal)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.alpha = 0.5
        self.backgroundColor = .blue
    }
    
    @objc private func colorsBtnTouchUpInside() {
        self.backgroundColor = .blue
           self.layer.borderWidth = 2
           self.layer.borderColor = UIColor.darkGray.cgColor
       }
    
     @objc private func colorsBtnTouchDown() {
         self.backgroundColor = .gray
     }
     
    @objc private func colorsBtnTouchUpOutside() {
        self.backgroundColor = .blue
         self.layer.borderWidth = 2
         self.layer.borderColor = UIColor.darkGray.cgColor
     }
}

