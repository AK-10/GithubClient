//
//  Repository.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/23.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation

struct Repository: Codable {
    let repositoryName: String
    let userName: String
    let language: String
    let description: String
    let starNum: String
    let url: URL
    
    static let dummyDatas = [
        Repository(repositoryName: "tanaka", userName: "yamada", language: "Swift", description: "this is dummy repository", starNum: "1000", url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka", userName: "yamada", language: "Swift", description: "this is dummy repository", starNum: "1000", url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka", userName: "yamada", language: "Swift", description: "this is dummy repository", starNum: "1000", url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka", userName: "yamada", language: "Swift", description: "this is dummy repository", starNum: "1000", url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka", userName: "yamada", language: "Swift", description: "this is dummy repository", starNum: "1000", url: URL(string: "https://github.com")!),
        Repository(repositoryName: "tanaka", userName: "yamada", language: "Swift", description: "this is dummy repository", starNum: "1000", url: URL(string: "https://github.com")!),
        ]
}
