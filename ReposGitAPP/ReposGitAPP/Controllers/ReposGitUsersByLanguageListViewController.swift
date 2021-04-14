//
//  ReposGitUsersByLanguageListViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxSwift

class ReposGitUsersByLanguageListViewController: UIViewController {
    
    //MARK: - Components
    private(set) lazy var mainView = ReposGitUsersByLanguageListMainView(viewModel: viewModel)
    var viewModel: ReposGitUserByLanguageViewModelProtocol?
    
    //MARK: - Variables
    private let disposeBagUI = DisposeBag()
    private var repositories: RepositoriesGitModel?
    
    //MARK: - Initializers
    convenience init(viewModel: ReposGitUserByLanguageViewModelProtocol?) {
        self.init()
        self.viewModel = viewModel
        bind()
        title = viewModel?.title.uppercased()
    }
    
    //MARK: - Override Methods
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.tableview.reloadData()
    }
   
    //MARK: - Custom Methods
    private func bind() {
        mainView
            .didTapSelectUserObservable
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (isRequest, items) in
                guard let self = self, let item = items else { return }
                if isRequest {
                    let vc = ReposGitReposByUserListViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }.disposed(by: disposeBagUI)
    }
}
