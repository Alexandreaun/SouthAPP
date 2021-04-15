//
//  ReposGitRepoDetailViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit

class ReposGitRepoDetailViewController: UIViewController {
    
    //MARK: - Components
    private(set) lazy var mainView = ReposGitRepoDetailMainView()
    
    //MARK: - Variables
    var viewModel: ReposGitDetailViewModelProtocol?
    
    //MARK: - Initializers
    convenience init(viewModel: ReposGitDetailViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
        title = viewModel?.title.uppercased()
    }
    
    //MARK: - Override Methods
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    
    //MARK: - Custom Methods

    
}
