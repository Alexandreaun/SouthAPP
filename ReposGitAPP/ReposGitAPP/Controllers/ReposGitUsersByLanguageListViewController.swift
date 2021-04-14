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
    private(set) lazy var mainView = ReposGitUsersByLanguageListMainView(repositories: repositories)
    
    //MARK: - Variables
    private let disposeBagUI = DisposeBag()
    private var repositories: RepositoriesGitModel?
    
    //MARK: - Initializers
    convenience init(repositories: RepositoriesGitModel?) {
        self.init()
        self.repositories = repositories
        bind()
    }
    
    //MARK: - Override Methods
    override func loadView() {
        super.loadView()
        view = mainView
        title = "Repos"
    }
   
    //MARK: - Custom Methods
    private func bind() {
        mainView
            .didTapSelectUserObservable
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (isRequest) in
                guard let self = self, let isTap = isRequest.element else { return }
                if isTap {
                    let vc = ReposGitReposByUserListViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }.disposed(by: disposeBagUI)
    }
}
