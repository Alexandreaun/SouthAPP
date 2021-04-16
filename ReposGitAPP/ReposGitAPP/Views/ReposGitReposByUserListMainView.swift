//
//  ReposGitReposByUserListMainView.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxRelay

class ReposGitReposByUserListMainView: UIView {
    
    //MARK: - Components
    private lazy var tableview: UITableView = {
        let v = UITableView()
        v.showsVerticalScrollIndicator = false
        v.separatorStyle = .none
        v.register(ReposGitReposByUserListCell.self, forCellReuseIdentifier: ReposGitReposByUserListCell.reuseIdentifier)
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    //MARK: - Variables
    private(set) public var didTapSelectRepoObservable = BehaviorRelay<(Bool, Items?)>(value:( false, nil))
    private var isIPhone_5_5s_5c_SE: Bool { UIScreen.main.nativeBounds.height == 1136 }
    private var viewModel: ReposGitReposByUserListViewModelProtocol?
    
    //MARK: - Initializers
    convenience init(viewModel: ReposGitReposByUserListViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
        setupView()
    }
}

//MARK: - Auto Layout
extension ReposGitReposByUserListMainView {
    private func setupView() {
        buildHierarquie()
        setupConstraints()
        setupAditionalConfigurations()
    }
    
    private func buildHierarquie() {
        addSubview(tableview)
    }
    
    private func setupConstraints() {
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: topAnchor, constant: isIPhone_5_5s_5c_SE ? 68 : 90),
            tableview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    private func setupAditionalConfigurations() {
        self.backgroundColor = .lightGray
    }
}

//MARK: - Extension Delegate and DataSource
extension ReposGitReposByUserListMainView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.repositoryUserData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: ReposGitReposByUserListCell.reuseIdentifier, for: indexPath) as? ReposGitReposByUserListCell, let items = viewModel?.repositoryUserData else { return UITableViewCell() }
        
        cell.reposContents = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapSelectRepoObservable.accept((true, viewModel?.repositoryUserData?[indexPath.row]))
    }
}
