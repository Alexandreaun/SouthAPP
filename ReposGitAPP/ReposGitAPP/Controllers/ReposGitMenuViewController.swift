//
//  ViewController.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 09/04/21.
//

import UIKit
import RxSwift

class ReposGitMenuViewController: UIViewController {
    
    //MARK: - Components
    private let mainView = ReposGitMenuMainView()
    
    
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
        mainView.buttonTypeTapped.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (typeButton) in
                guard let self = self else { return }
                switch typeButton {
                case .next(TypeButtonTapped.swiftButton):
                    let vc = ReposGitUsersByLanguageListViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                case .next(TypeButtonTapped.objectiveCButton):
                    let vc = ReposGitUsersByLanguageListViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                case .next(TypeButtonTapped.javaButton):
                    let vc = ReposGitUsersByLanguageListViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                case .next(TypeButtonTapped.javaScriptButton):
                    let vc = ReposGitUsersByLanguageListViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
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
