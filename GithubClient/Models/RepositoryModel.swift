//
//  RepositoryModel.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/23.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class RepositoryModel: ModelProtocol {
    
    func search(query: String) -> Single<[Repository]> {
        return Single<[Repository]>.create { singleEvent in
            let request = AF.request(Router.search(query: query)).responseJSON(completionHandler: { (res) in
                print(query)
                print(res.result)
                switch res.result {
                case .success(let value):
                    print(value)
                    singleEvent(.success(Repository.dummyDatas))
                case .failure(let err):
                    singleEvent(.error(err))
                }
            })
            return Disposables.create { request.cancel() }
        }

    }
    
    func favorite() {
        print("fav!")
    }
}
