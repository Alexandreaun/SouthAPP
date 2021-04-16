//
//  ReposGitRepoDetailViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxSwift

class ReposGitRepoDetailViewController: UIViewController {
    
    //MARK: - Components
    private(set) lazy var mainView = ReposGitRepoDetailMainView(viewModel: viewModel)
    
    //MARK: - Variables
    var viewModel: ReposGitDetailViewModelProtocol?
    private let disposeBagUI = DisposeBag()
    
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
}
