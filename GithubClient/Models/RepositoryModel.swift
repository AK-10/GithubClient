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
import UIKit

class RepositoryModel: ModelProtocol {
    
    func search(query: String) -> Single<[Repository]> {
        return Single<[Repository]>.create { singleEvent in
            let request = AF.request(Router.search(query: query)).responseJSON(completionHandler: { (res) in
                print(query)
                print("result: \(res.result)")
                switch res.result {
                case .success:
                    print(res.debugDescription)
                    do {
                        let responseItem = try JSONDecoder().decode(SearchRepositoriesResponse.self, from: res.data!)
                        singleEvent(.success(responseItem.items))

                    } catch let e {
                        print(e)
                        singleEvent(.error(e))
                    }
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
