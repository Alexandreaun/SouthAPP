//
//  RepositoriesGitModel.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 12/04/21.
//

import Foundation

struct RepositoriesGitModel: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Items]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items = "items"
    }
}

struct Items: Codable {
    let id: Int?
    let name: String?
    let fullName: String?
    let privateRepo: Bool?
    let owner: Owner?
    let description: String?
    let fork: Bool?
    let stargazersCount: Int?
    let forks: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case fullName = "full_name"
        case privateRepo = "private"
        case owner = "owner"
        case description = "description"
        case fork = "fork"
        case stargazersCount = "stargazers_count"
        case forks = "forks"
    }
}

struct Owner: Codable {
    let login: String?
    let avatarUrl: String?
    let url: String?
    let reposUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
        case url = "url"
        case reposUrl = "repos_url"
    }
}
