//
//  MenuMainView.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 10/04/21.
//

import UIKit

class ReposGitMenuMainView: UIView {
    
    //MARK: - Components
    private let containerStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        return s
    }()
    
    private let titleLabel = UILabel(text: "Escolha uma linguagem para visualizar os repositórios Git Hub.", font: UIFont().mainFontApp(size: 18), numberOfLines: 0, textAlignment: .center)
    
    private let swiftButton: CustomButton = {
        let b = CustomButton(widht: 100, height: 150, backgroundColor: .red)
        b.setTitle("Swift", for: .normal)
        return b
    }()
    
    private let objectiveCButton: CustomButton = {
        let b = CustomButton(widht: 100, height: 150, backgroundColor: .orange)
        b.setTitle("Objective-C", for: .normal)
        return b
    }()
    
    private let javaButton: CustomButton = {
        let b = CustomButton(widht: 100, height: 150, backgroundColor: .gray)
        b.setTitle("Java", for: .normal)
        return b
    }()
    
    private let javaScriptButton: CustomButton = {
        let b = CustomButton(widht: 100, height: 150, backgroundColor: .systemBlue)
        b.setTitle("JavaScript", for: .normal)
        return b
    }()
    
    private lazy var languagesOneStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [swiftButton, objectiveCButton])
        s.spacing = 10
        s.distribution = .fillEqually
        return s
    }()
    
    private lazy var languagesTwoStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [javaButton, javaScriptButton])
        s.spacing = 10
        s.distribution = .fillEqually
        return s
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Methods
        
    
    
    
}

//MARK: - Setup Constraints
extension ReposGitMenuMainView {
    private func setupView() {
        buildHierarquie()
        setupConstraints()
    }
    
    private func buildHierarquie() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addSpace(height: 40)
        containerStackView.addArrangedSubview(languagesOneStackView)
        containerStackView.addSpace(height: 10)
        containerStackView.addArrangedSubview(languagesTwoStackView)
    }
    
    private func setupConstraints() {

        
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])

    }
}

//MARK: - Private Extensions
private extension UILabel {
    convenience init(text: String, font: UIFont = UIFont().mainFontApp(size: 12), textColor: UIColor = UIColor.black, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}

private extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .fill) {
        self.init()
        self.axis = axis
        self.distribution = distribution
    }
}


