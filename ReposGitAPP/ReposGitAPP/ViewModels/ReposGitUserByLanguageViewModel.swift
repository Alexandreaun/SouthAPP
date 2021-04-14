//
//  ReposGitMenuViewModel.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 13/04/21.
//

import RxSwift
import RxRelay

enum ReposGitUserByLanguageViewModelState {
    case getUsersByLanguage
    case isLoading(isShow: Bool)
    case error(error: NetworkError)
    case `default`
}

protocol ReposGitUserByLanguageViewModelProtocol {
    init(worker: ReposGiWorker?)
    var worker: ReposGiWorker {get}
    var repositoriesData: RepositoriesGitModel? {get}
    func getUsersByLanguage(language: String)
    var state: BehaviorRelay<ReposGitUserByLanguageViewModelState> {get}
    var title: String {get}
}

public class ReposGitUserByLanguageViewModel: ReposGitUserByLanguageViewModelProtocol {

    var worker: ReposGiWorker
    var repositoriesGitModel: RepositoriesGitModel?
    var state = BehaviorRelay<ReposGitUserByLanguageViewModelState>(value: ReposGitUserByLanguageViewModelState.default)
    var repositoriesData: RepositoriesGitModel?
    var title: String = ""

    required init(worker: ReposGiWorker? = nil) {
        self.worker = worker ?? ReposGiWorker()
    }
    
    func getUsersByLanguage(language: String) {
        state.accept(ReposGitUserByLanguageViewModelState.isLoading(isShow: true))
        worker.getUsersByLanguage(language: language) { [weak self] (result) in
            guard let self = self else { return }
            self.title = language
            self.state.accept(ReposGitUserByLanguageViewModelState.isLoading(isShow: false))
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.repositoriesData = data
                    self.state.accept(ReposGitUserByLanguageViewModelState.getUsersByLanguage)
                case .failure(let error):
                    self.state.accept(ReposGitUserByLanguageViewModelState.error(error: error))
                }
            }
        }
    }
}
