//
//  ReposGitMenuViewModel.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 13/04/21.
//

import RxSwift
import RxRelay

enum ReposGitMenuViewModelState {
    case getUsersByLanguage(data: RepositoriesGitModel?)
    case isLoading(isShow: Bool)
    case error(error: NetworkError)
    case `default`
}

protocol ReposGitMenuViewModelProtocol {
    init(worker: ReposGiWorker?)
    var worker: ReposGiWorker {get}
    func getUsersByLanguage(language: String)
    var state: BehaviorRelay<ReposGitMenuViewModelState> {get}
}

public class ReposGitMenuViewModel: ReposGitMenuViewModelProtocol {

    var worker: ReposGiWorker
    var repositoriesGitModel: RepositoriesGitModel?
    var state = BehaviorRelay<ReposGitMenuViewModelState>(value: ReposGitMenuViewModelState.default)

    required init(worker: ReposGiWorker? = nil) {
        self.worker = worker ?? ReposGiWorker()
    }
    
    func getUsersByLanguage(language: String) {
        state.accept(ReposGitMenuViewModelState.isLoading(isShow: true))
        worker.getUsersByLanguage(language: language) { [weak self] (result) in
            guard let self = self else { return }
            self.state.accept(ReposGitMenuViewModelState.isLoading(isShow: false))
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.state.accept(ReposGitMenuViewModelState.getUsersByLanguage(data: data))
                case .failure(let error):
                    self.state.accept(ReposGitMenuViewModelState.error(error: error))
                }
            }
        }
    }
}
