//
//  ViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 09/04/21.
//

import UIKit
import RxSwift

class ReposGitMenuViewController: BaseViewController {
    
    //MARK: - Components
    private let mainView = ReposGitMenuMainView()
    private let viewModel = ReposGitUserByLanguageViewModel()
    
    //MARK: - Variables
    private let disposeBagUI = DisposeBag()
    
    //MARK: - Initializer
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    //MARK: - Custom Methods
    private func setupNavigation() {
        title = "Escolha a Linguagem"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .blueOil
    }
    
    private func bind() {
        
        viewModel.state.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (state) in
                guard let self = self else { return }
                switch state {
                case .next(ReposGitUserByLanguageViewModelState.getUsersByLanguage):
                    let vc = ReposGitUsersByLanguageListViewController(viewModel: self.viewModel)
                    self.navigationController?.pushViewController(vc, animated: true)
                case .next(ReposGitUserByLanguageViewModelState.isLoading(let isShow)):
                    isShow ? self.showLoadingAnimation() : self.hiddenLoadingAnimation()
                case .next(ReposGitUserByLanguageViewModelState.error):
                    self.showError(buttonLabel: "OK", titleError: "Atenção", messageError: "Tivemos um problema ao solicitar as informações, por favor, verifique sua conexão de internet ou tente novamente mais tarde")
                case .next(ReposGitUserByLanguageViewModelState.default):
                    break
                case .error:
                    self.showError(buttonLabel: "OK", titleError: "Atenção", messageError: "Tivemos um problema, por favor, tente novamente mais tarde")
                case .completed:
                    break
                }
            }.disposed(by: disposeBagUI)
        
        mainView.buttonTypeTapped.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (typeButton) in
                guard let self = self else { return }
                switch typeButton {
                case .next(TypeButtonTapped.swiftButton(let language)):
                    self.viewModel.getUsersByLanguage(language: language)
                case .next(TypeButtonTapped.objectiveCButton(let language)):
                    self.viewModel.getUsersByLanguage(language: language)
                case .next(TypeButtonTapped.javaButton(let language)):
                    self.viewModel.getUsersByLanguage(language: language)
                case .next(TypeButtonTapped.javaScriptButton(let language)):
                    self.viewModel.getUsersByLanguage(language: language)
                case .next(TypeButtonTapped.default):
                    break
                case .error(_):
                    break
                case .completed:
                    break
                }
            }.disposed(by: disposeBagUI)
    }
}
