//
//  ReposGitReposByUserListCell.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit

class ReposGitReposByUserListCell: UITableViewCell {
    
    //MARK: - Components
    private let avatarImageView: UIImageView = {
        let imv = UIImageView()
        imv.layer.cornerRadius = 55
        imv.clipsToBounds = true
        imv.layer.borderWidth = 4
        imv.layer.borderColor = UIColor.gray.cgColor
        return imv
    }()
    
    private lazy var contentsStackView = UIStackView(
        axis: .vertical,
        spacing: 10,
        arrangedSubviews:
            [
                nameLabel,
                repoLabel,
                UIStackView(
                    spacing: 10,
                    arrangedSubviews:
                        [
                            iconImageView,
                            countLabel
                        ]
                    ,
                    alignment: .center)
            ]
        ,
        alignment: .leading
    )
    
    private let nameLabel = UILabel(font: UIFont().mainFontApp(size: 12), textColor: UIColor.black, numberOfLines: 0)
    private lazy var repoLabel = UILabel(font: UIFont().mainFontApp(size: 12), textColor: isPrivateRepo() ? UIColor.red : UIColor.green, numberOfLines: 0)
    private let countLabel = UILabel(font: UIFont().mainFontApp(size: 12), textColor: UIColor.black)
    
    private let iconImageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "fork"))
        v.heightAnchor.constraint(equalToConstant: 25).isActive = true
        v.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return v
    }()
    
    private let lineDivider: UIView = {
        let v = UIView()
        v.backgroundColor = .newGray
        return v
    }()
    
    //MARK: - Variables
    static let reuseIdentifier = "ReposGitReposByUserListCell"
    public var reposContents: Items? {
        didSet {
            setupView()
            setupContents()
        }
    }
    
    //MARK: - Custom Methods
    private func setupContents() {
        avatarImageView.loadSDWebImage(imageView: avatarImageView, string: reposContents?.owner?.avatarUrl ?? "")
        nameLabel.text = "Nome Repo: \(reposContents?.name ?? "-")"
        countLabel.text = "Forks: \(reposContents?.forks ?? 0)"
        if let privateRepo = reposContents?.privateRepo {
            repoLabel.text = "\((privateRepo) ? "Private" : "Public")"
        }
    }
    
    private func isPrivateRepo() -> Bool {
        guard let privateRepo = reposContents?.privateRepo else { return false }
        return privateRepo
    }
}

//MARK: - Auto Layout
extension ReposGitReposByUserListCell {
    private func setupView() {
        buildHierarquie()
        setupConstraints()
        setupAditionalConfigurations()
    }
    
    private func buildHierarquie() {
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(lineDivider)
        self.contentView.addSubview(contentsStackView)
    }
    
    private func setupConstraints() {
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            avatarImageView.heightAnchor.constraint(equalToConstant: 115),
            avatarImageView.widthAnchor.constraint(equalToConstant: 115)
        ])
        
        lineDivider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineDivider.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 0),
            lineDivider.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            lineDivider.widthAnchor.constraint(equalToConstant: 1),
            lineDivider.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 0)
        ])
        
        contentsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            contentsStackView.leadingAnchor.constraint(equalTo: lineDivider.trailingAnchor, constant: 25),
            contentsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    private func setupAditionalConfigurations() {
        self.backgroundColor = .lightGray
    }
}

//MARK: - Private Extensions
private extension UILabel {
    convenience init(text: String = "", font: UIFont = UIFont().mainFontApp(size: 12), textColor: UIColor = UIColor.black, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}

private extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, arrangedSubviews: [UIView] = [], isHidden: Bool = false, alignment: UIStackView.Alignment = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.isHidden = isHidden
        self.alignment = alignment
    }
}
