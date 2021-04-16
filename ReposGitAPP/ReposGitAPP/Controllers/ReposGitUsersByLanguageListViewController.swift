//
//  ReposGitUsersByLanguageListViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxSwift

class ReposGitUsersByLanguageListViewController: BaseViewController {
    
    //MARK: - Components
    private(set) lazy var mainView = ReposGitUsersByLanguageListMainView(viewModel: viewModel)
    
    //MARK: - Variables
    private let disposeBagUI = DisposeBag()
    private let viewModelRepos = ReposGitReposByUserListViewModel()
    var viewModel: ReposGitUserByLanguageViewModelProtocol?
    
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
        
        viewModelRepos.state.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (state) in
                guard let self = self else { return }
                switch state {
                case .next(ReposGitReposByUserListViewModelState.getReposByUser):
                    let vc = ReposGitReposByUserListViewController(viewModel: self.viewModelRepos)
                    self.navigationController?.pushViewController(vc, animated: true)
                case .next(ReposGitReposByUserListViewModelState.isLoading(let isShow)):
                    isShow ? self.showLoadingAnimation() : self.hiddenLoadingAnimation()
                case .next(ReposGitReposByUserListViewModelState.error):
                    self.showError(buttonLabel: "OK", titleError: "Atenção", messageError: "Tivemos um problema ao solicitar as informações, por favor, verifique sua conexão de internet ou tente novamente mais tarde")
                case .next(ReposGitReposByUserListViewModelState.default):
                    break
                case .error:
                    self.showError(buttonLabel: "OK", titleError: "Atenção", messageError: "Tivemos um problema, por favor, tente novamente mais tarde")
                case .completed:
                    break
                }
            }.disposed(by: disposeBagUI)
        
        mainView
            .didTapSelectUserObservable
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (isRequest, items) in
                guard let self = self, let item = items, let login = item.owner?.login else { return }
                if isRequest {
                    self.viewModelRepos.getReposByUser(login: login)
                }
            }.disposed(by: disposeBagUI)
    }
}
