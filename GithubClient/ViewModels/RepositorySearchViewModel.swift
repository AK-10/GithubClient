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

class RepositorySearchViewModel {
    let resultRepositories = BehaviorRelay<[Repository]>(value: [])
    
    private let model: ModelProtocol = RepositoryModel()
    private let disposeBag = DisposeBag()
    
    init(searchWordObservable: Observable<String?>, model: ModelProtocol) {
        searchWordObservable.subscribe{ [weak self] event in
            switch event {
            case .next(let word):
                guard let query = word else { return }
                self?.resultRepositories.accept(model.search(query: query))
            default:
                break
            }
        }.disposed(by: disposeBag)
    }
    
}