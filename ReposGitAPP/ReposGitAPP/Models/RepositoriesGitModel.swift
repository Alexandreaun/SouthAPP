//
//  RepositoriesGitModel.swift
//  ReposGitAPP
//
//  Created by Alexandre Aun on 12/04/21.
//

import Foundation

public struct RepositoriesGitModel: Codable {
    public let totalCount: Int?
    public let incompleteResults: Bool?
    public let items: [Items]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items = "items"
    }
}

public struct Items: Codable {
    public let id: Int?
    public let name: String?
    public let fullName: String?
    public let privateRepo: Bool?
    public let owner: Owner?
    public let htmlUrl: String?
    public let description: String?
    public let fork: Bool?
    public let stargazersCount: Int?
    public let forks: Int?
    public let language: String?
    public let forksCount: Int?
    public let openIssuesCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case fullName = "full_name"
        case privateRepo = "private"
        case owner = "owner"
        case htmlUrl = "html_url"
        case description = "description"
        case fork = "fork"
        case stargazersCount = "stargazers_count"
        case forks = "forks"
        case language = "language"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
    }
}

public struct Owner: Codable {
    public let login: String?
    public let avatarUrl: String?
    public let url: String?
    public let reposUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
        case url = "url"
        case reposUrl = "repos_url"
    }
}
