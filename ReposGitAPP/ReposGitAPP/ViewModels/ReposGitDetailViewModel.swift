//
//  ReposGitDetailViewModel.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 15/04/21.
//

import RxSwift
import RxRelay

enum ReposGitDetailViewModelState {
    case getRepoDetail
    case isLoading(isShow: Bool)
    case error(error: NetworkError)
    case `default`
}

protocol ReposGitDetailViewModelProtocol {
    init(worker: ReposGiWorker?)
    var worker: ReposGiWorker {get}
    var repositoryDetail: Items? {get}
    func getDetailRepoByUser(login: String, nameRepo: String)
    var state: BehaviorRelay<ReposGitDetailViewModelState> {get}
    var title: String {get}
}

public class ReposGitDetailViewModel: ReposGitDetailViewModelProtocol {
    
    var worker: ReposGiWorker
    var state = BehaviorRelay<ReposGitDetailViewModelState>(value: ReposGitDetailViewModelState.default)
    var repositoryDetail: Items?
    var title: String = ""
    
    required init(worker: ReposGiWorker? = nil) {
        self.worker = worker ?? ReposGiWorker()
    }
    
    func getDetailRepoByUser(login: String, nameRepo: String) {
        state.accept(ReposGitDetailViewModelState.isLoading(isShow: true))
        worker.getDetailRepoByUser(login: login, nameRepo: nameRepo) { [weak self] (result) in
            guard let self = self else { return }
            self.title = nameRepo
            self.state.accept(ReposGitDetailViewModelState.isLoading(isShow: false))
            switch result {
            case .success(let data):
                self.repositoryDetail = data
                self.state.accept(ReposGitDetailViewModelState.getRepoDetail)
            case .failure(let error):
                self.state.accept(ReposGitDetailViewModelState.error(error: error))
            }
        }
    }
}
