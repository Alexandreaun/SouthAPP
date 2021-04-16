//
//  ReposGitUsersByLanguageListMainView.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxRelay

class ReposGitUsersByLanguageListMainView: UIView {
    
    //MARK: - Components
    public lazy var tableview: UITableView = {
        let v = UITableView()
        v.showsVerticalScrollIndicator = false
        v.separatorStyle = .none
        v.register(ReposGitUsersByLanguageListCell.self, forCellReuseIdentifier: ReposGitUsersByLanguageListCell.reuseIdentifier)
        v.delegate = self
        v.dataSource = self
        v.reloadData()
        return v
    }()
    
    //MARK: - Variables
    private(set) public var didTapSelectUserObservable = BehaviorRelay<(Bool, Items?)>(value:( false, nil))
    private var viewModel: ReposGitUserByLanguageViewModelProtocol?
    private var isIPhone_5_5s_5c_SE: Bool { UIScreen.main.nativeBounds.height == 1136 }
    
    //MARK: - Initializers
    convenience init(viewModel: ReposGitUserByLanguageViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
        setupView()
    }
}

//MARK: - Auto Layout
extension ReposGitUsersByLanguageListMainView {
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
extension ReposGitUsersByLanguageListMainView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.repositoriesData?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: ReposGitUsersByLanguageListCell.reuseIdentifier, for: indexPath) as? ReposGitUsersByLanguageListCell, let items = viewModel?.repositoriesData?.items else { return UITableViewCell() }
        cell.reposContents = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapSelectUserObservable.accept((true, viewModel?.repositoriesData?.items?[indexPath.row]))
    }
}
