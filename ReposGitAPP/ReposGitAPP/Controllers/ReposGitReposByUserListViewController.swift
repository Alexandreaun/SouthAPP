//
//  ReposGitReposByUserListViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxSwift

class ReposGitReposByUserListViewController: BaseViewController {
    
    //MARK: - Components
    private(set) lazy var mainView = ReposGitReposByUserListMainView(viewModel: viewModel)
    
    //MARK: - Variables
    private let disposeBagUI = DisposeBag()
    let viewModelDetail = ReposGitDetailViewModel()
    var viewModel: ReposGitReposByUserListViewModelProtocol?
    
    //MARK: - Initializers
    convenience init(viewModel: ReposGitReposByUserListViewModelProtocol?) {
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

    //MARK: - Custom Methods
    private func bind() {

        viewModelDetail.state.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (state) in
                guard let self = self else { return }
                switch state {
                case .next(ReposGitDetailViewModelState.getRepoDetail):
                    let vc = ReposGitRepoDetailViewController(viewModel: self.viewModelDetail)
                    self.navigationController?.pushViewController(vc, animated: true)
                case .next(ReposGitDetailViewModelState.isLoading(let isShow)):
                    isShow ? self.showLoadingAnimation() : self.hiddenLoadingAnimation()
                case .next(ReposGitDetailViewModelState.error):
                    self.showError(buttonLabel: "OK", titleError: "Atenção", messageError: "Tivemos um problema ao solicitar as informações, por favor, verifique sua conexão de internet ou tente novamente mais tarde")
                case .next(ReposGitDetailViewModelState.default):
                    break
                case .error:
                    self.showError(buttonLabel: "OK", titleError: "Atenção", messageError: "Tivemos um problema, por favor, tente novamente mais tarde")
                case .completed:
                    break
                }
            }
        
        mainView
            .didTapSelectRepoObservable
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (isRequest, items) in
                guard let self = self, let item = items, let login = item.owner?.login, let name = item.name else { return }
                if isRequest {
                    self.viewModelDetail.getDetailRepoByUser(login: login, nameRepo: name)
                }
            }.disposed(by: disposeBagUI)
    }
}
