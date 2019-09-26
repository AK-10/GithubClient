//
//  RepositoryModel.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/23.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation

class RepositoryModel: ModelProtocol {
    func search(query: String) -> [Repository] {
        return Repository.dummyDatas
    }
    
    func favorite() {
        print("fav!")
    }
}
