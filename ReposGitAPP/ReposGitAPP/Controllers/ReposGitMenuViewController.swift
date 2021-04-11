//
//  ViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 09/04/21.
//

import UIKit

class ReposGitMenuViewController: UIViewController {
    
    //MARK: - Components
    private let mainView = ReposGitMenuMainView()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.topItem?.title = "Escolha a Linguagem"
        navigationController?.navigationBar.barTintColor = .blueOil
    }
    
    private func setupView() {
        
    }
    
    
}
