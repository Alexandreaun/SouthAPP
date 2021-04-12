//
//  ReposGitRepoDetailViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit

class ReposGitRepoDetailViewController: UIViewController {
    
    let mainView = ReposGitRepoDetailMainView()
    
    //MARK: - Override Methods
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    //MARK: - Custom Methods
    private func setupNavigation() {
        title = "Escolha a Linguagem"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .blueOil
    }
    
}
