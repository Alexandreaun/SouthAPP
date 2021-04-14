//
//  ReposGitWorker.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 13/04/21.
//

import Foundation

protocol CurrenciesRequestDelegate {
    func getUsersByLanguage(language: String, with completion: @escaping (_ result: Result<RepositoriesGitModel?, NetworkError>) -> Void)
    func getReposByUser(login: String, with completion: @escaping (_ result: Result<[Items]?, NetworkError>) -> Void)
    func getDetailRepoByUser(login: String, nameRepo: String, with completion: @escaping (_ result: Result<Items?, NetworkError>) -> Void)
}

class ReposGiWorker: CurrenciesRequestDelegate {

    let manager = ReposGitNetworkManager()
    
    func getUsersByLanguage(language: String, with completion: @escaping (Result<RepositoriesGitModel?, NetworkError>) -> Void) {
        manager.getUsersByLanguage(language: language, with: completion)
    }
    
    func getReposByUser(login: String, with completion: @escaping (Result<[Items]?, NetworkError>) -> Void) {
        manager.getReposByUser(login: login, with: completion)
    }
    
    func getDetailRepoByUser(login: String, nameRepo: String, with completion: @escaping (Result<Items?, NetworkError>) -> Void) {
        manager.getDetailRepoByUser(login: login, nameRepo: nameRepo, with: completion)
    }
}
