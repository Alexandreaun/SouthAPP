//
//  ReposGitReposByUserListViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 11/04/21.
//

import UIKit
import RxSwift

class ReposGitReposByUserListViewController: UIViewController {
    
    //MARK: - Components
    let mainView = ReposGitReposByUserListMainView()
    
    //MARK: - Variables
    private let disposeBagUI = DisposeBag()
    
    //MARK: - Initializers
//    convenience init(viewModel: ReposGitUserByLanguageViewModelProtocol?) {
//        self.init()
//        self.viewModel = viewModel
//        bind()
//       // title = viewModel?.title.uppercased()
//    }
    
    //MARK: - Override Methods
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    

    //MARK: - Custom Methods
    private func bind() {
        mainView
            .didTapSelectUserObservable
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (isRequest) in
                guard let self = self, let isTap = isRequest.element else { return }
                if isTap {
                    let vc = ReposGitRepoDetailViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }.disposed(by: disposeBagUI)
    }
    
    
}
