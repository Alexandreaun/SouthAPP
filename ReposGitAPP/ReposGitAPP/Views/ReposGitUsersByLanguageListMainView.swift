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
    private lazy var tableview: UITableView = {
        let v = UITableView()
        v.showsVerticalScrollIndicator = false
        v.separatorStyle = .none
        v.register(ReposGitUsersByLanguageListCell.self, forCellReuseIdentifier: ReposGitUsersByLanguageListCell.reuseIdentifier)
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    //MARK: - Variables
    private(set) public var didTapSelectUserObservable = BehaviorRelay<Bool>(value: false)
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//MARK: - Auto Layout
extension ReposGitUsersByLanguageListMainView {
    private func setupView() {
        buildHierarquie()
        setupConstraints()
    }
    
    private func buildHierarquie() {
        addSubview(tableview)
    }
    
    private func setupConstraints() {
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            tableview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - Extension Delegate and DataSource
extension ReposGitUsersByLanguageListMainView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: ReposGitUsersByLanguageListCell.reuseIdentifier, for: indexPath) as? ReposGitUsersByLanguageListCell else { return UITableViewCell() }
        
        cell.reposContents = "Teste"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapSelectUserObservable.accept(true)
    }
    
    
    
    
    
}
