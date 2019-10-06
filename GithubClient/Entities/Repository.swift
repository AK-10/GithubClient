//
//  Repository.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/23.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation

struct SearchRepositoriesResponse: Decodable {
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Repository: Decodable {
    let repositoryName: String
    let language: String?
    let description: String?
    let starNum: Int
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case repositoryName = "full_name"
        case language
        case description
        case starNum = "stargazers_count"
        case url = "html_url"
    }
    
    static let dummyDatas = [
        Repository(repositoryName: "tanaka/yamada generator", language: "Swift", description: "this is dummy repository", starNum: 1000, url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka/yamada generator", language: "Swift", description: "this is dummy repository", starNum: 1000, url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka/yamada generator", language: "Swift", description: "this is dummy repository", starNum: 1000, url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka/yamada generator", language: "Swift", description: "this is dummy repository", starNum: 1000, url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka/yamada generator", language: "Swift", description: "this is dummy repository", starNum: 1000, url: URL(string: "https://github.com")!),
    ]
}
