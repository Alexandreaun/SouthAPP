//
//  ReposGitReposByUserListViewModel.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 14/04/21.
//

import RxSwift
import RxRelay

enum ReposGitReposByUserListViewModelState {
    case getReposByUser
    case isLoading(isShow: Bool)
    case error(error: NetworkError)
    case `default`
}

protocol ReposGitReposByUserListViewModelProtocol {
    init(worker: ReposGiWorker?)
    var worker: ReposGiWorker {get}
    var repositoryUserData: [Items]? {get}
    func getReposByUser(login: String)
    var state: BehaviorRelay<ReposGitReposByUserListViewModelState> {get}
    var title: String {get}
}

public class ReposGitReposByUserListViewModel: ReposGitReposByUserListViewModelProtocol {

    var worker: ReposGiWorker
    var state = BehaviorRelay<ReposGitReposByUserListViewModelState>(value: ReposGitReposByUserListViewModelState.default)
    var repositoryUserData: [Items]?
    var title: String = ""

    required init(worker: ReposGiWorker? = nil) {
        self.worker = worker ?? ReposGiWorker()
    }
    
    func getReposByUser(login: String) {
        state.accept(ReposGitReposByUserListViewModelState.isLoading(isShow: true))
        worker.getReposByUser(login: login) { [weak self] (result) in
            guard let self = self else { return }
            self.title = login
            self.state.accept(ReposGitReposByUserListViewModelState.isLoading(isShow: false))
                switch result {
                case .success(let data):
                    self.repositoryUserData = data
                    self.state.accept(ReposGitReposByUserListViewModelState.getReposByUser)
                case .failure(let error):
                    self.state.accept(ReposGitReposByUserListViewModelState.error(error: error))
            }
        }
    }
}
