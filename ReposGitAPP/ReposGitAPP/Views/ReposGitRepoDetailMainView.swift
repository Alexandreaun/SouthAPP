//
//  ReposGitRepoDetailMainView.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxRelay

class ReposGitRepoDetailMainView: UIView {
    
    //MARK: - Components
    private let avatarImageView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleToFill
        return v
    }()
    
    private let titleLabel = UILabel(text: "Detalhes do Repositório", font: UIFont().mainFontApp(size: 18), textColor: UIColor.black, numberOfLines: 0, textAlignment: .center)
    
    private lazy var detailsStackView = UIStackView(axis: .vertical)
    
    private let containerArrowView = UIView()
    private let arrowImageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "arrow"))
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    //MARK: - Variables
    var viewModel: ReposGitDetailViewModelProtocol?
    private var contentsList: [ReposGitDetail] {
        [
            ReposGitDetail(title: "Repositório:", content: viewModel?.repositoryDetail?.name ?? "-"),
            ReposGitDetail(title: "Login:", content: viewModel?.repositoryDetail?.owner?.login ?? "-"),
            ReposGitDetail(title: "Url Repo:", content: viewModel?.repositoryDetail?.htmlUrl ?? "-"),
            ReposGitDetail(title: "Descrição:", content: viewModel?.repositoryDetail?.description ?? "-"),
            ReposGitDetail(title: "Linguagem:", content: viewModel?.repositoryDetail?.language ?? "-"),
            ReposGitDetail(title: "Problemas:", content: String(describing: viewModel?.repositoryDetail?.openIssuesCount ?? 0))
        ]
    }
    private var isIPhone_5_5s_5c_SE: Bool { UIScreen.main.nativeBounds.height == 1136 }
    
    //MARK: - Initializers
    convenience init(viewModel: ReposGitDetailViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
        setupView()
    }
    
    //MARK: - Custom Methods
    private func buildDetailsList() -> UIStackView {
        let verticalStackView = UIStackView(axis: .vertical, spacing: 10)
        
        contentsList.forEach {
            let horizontalView = UIView()
            let titleLabel = UILabel(text: $0.title ?? "", font: UIFont().mainFontApp(size: isIPhone_5_5s_5c_SE ? 10 : 16).bold(), textColor: UIColor.blueOil)
            let contentLabel = UILabel(text: $0.content ?? "-", font: UIFont().mainFontApp(size: isIPhone_5_5s_5c_SE ? 10 : 16), textColor: UIColor.gray, numberOfLines: 0)
            horizontalView.addSubview(titleLabel)
            horizontalView.addSubview(contentLabel)
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: horizontalView.topAnchor, constant: 0),
                titleLabel.leadingAnchor.constraint(equalTo: horizontalView.leadingAnchor, constant: 0),
                titleLabel.trailingAnchor.constraint(equalTo: horizontalView.trailingAnchor, constant: isIPhone_5_5s_5c_SE ? -200 : -250),
                titleLabel.bottomAnchor.constraint(equalTo: horizontalView.bottomAnchor, constant: 0)
            ])
            
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentLabel.topAnchor.constraint(equalTo: horizontalView.topAnchor, constant: 0),
                contentLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
                contentLabel.trailingAnchor.constraint(equalTo: horizontalView.trailingAnchor, constant: 0),
                contentLabel.bottomAnchor.constraint(equalTo: horizontalView.bottomAnchor, constant: 0)
            ])
            verticalStackView.addArrangedSubview(horizontalView)
        }
        return verticalStackView
    }
}

//MARK: - AutoLayout
extension ReposGitRepoDetailMainView {
    private func setupView() {
        buildHierarquie()
        setupConstraints()
        setupAditionalConfigurations()
    }
    
    private func buildHierarquie() {
        addSubview(avatarImageView)
        addSubview(detailsStackView)
        detailsStackView.addArrangedSubview(titleLabel)
        detailsStackView.addSpace(height: 15)
        detailsStackView.addArrangedSubview(buildDetailsList())
    }
    
    private func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            avatarImageView.heightAnchor.constraint(equalToConstant: isIPhone_5_5s_5c_SE ? 200 : 350)
        ])
        
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 25),
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
    }
    
    private func setupAditionalConfigurations() {
        self.backgroundColor = .lightGray
        avatarImageView.loadSDWebImage(imageView: avatarImageView, string: viewModel?.repositoryDetail?.owner?.avatarUrl ?? "")
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
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, arrangedSubviews: [UIView] = [], isHidden: Bool = false, alignment: UIStackView.Alignment = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.isHidden = isHidden
        self.alignment = alignment
    }
}
