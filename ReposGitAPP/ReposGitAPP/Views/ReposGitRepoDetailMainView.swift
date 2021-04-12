//
//  ReposGitRepoDetailMainView.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit

class ReposGitRepoDetailMainView: UIView {
    
    //MARK: - Components
    private let avatarImageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "star"))
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    private var contentsView: UIView = {
        let v = UIView()
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 20
        v.alpha = 1
        v.backgroundColor = .white
        return v
    }()
    
    
    
    //MARK: - Variables
    
    
    
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}

//MARK: - AutoLayout
extension ReposGitRepoDetailMainView {
    private func setupView() {
        buildHierarquie()
        setupConstraints()
    }
    
    private func buildHierarquie() {
        addSubview(avatarImageView)
        addSubview(contentsView)
    }
    
    private func setupConstraints() {
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 360)
        ])
        
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -30),
            contentsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contentsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contentsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
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
