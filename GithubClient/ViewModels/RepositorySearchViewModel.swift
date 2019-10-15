//
//  SearchRepositoryViewModel.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/23.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

struct RepositorySearchViewModel {
        
    private let model: ModelProtocol = RepositoryModel()
    private let disposeBag = DisposeBag()

    // input
    var query = BehaviorRelay<String?>(value: "")
    // output
    var resultRepositories: Observable<[Repository]> {
        return query.flatMap{ str -> Observable<Observable<[Repository]>> in
            
        }
    }
    
//    init() {
//        query.subscribe { event in
//            switch event {
//            case .next(let text):
//                guard let q = text else { return }
//                self.model.search(query: q)
//            default:
//                break
//            }
//        }.disposed(by: disposeBag)
//    }
//
//    private func searchAction(searchWordObservable: Observable<String?>) {
//        searchWordObservable.subscribe { [weak self] event in
//            switch event {
//            case .next(let word):
//                guard let query = word else { return }
//                _ = self?.model.search(query: query).subscribe{ [weak self] event in
//                    switch event {
//                    case .success(let repositories):
//                        self?.resultRepositories.accept(repositories)
//                    case .error(let error):
//                        print(error)
//                    }
//                }
//            default:
//                break
//            }
//        }.disposed(by: disposeBag)
        
//    }
    
}
