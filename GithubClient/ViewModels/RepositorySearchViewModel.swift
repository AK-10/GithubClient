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
    
    // input
    let searchText: AnyObserver<String?>
    let modelSelected: AnyObserver<Repository>
    
    // output
    let repositories: Observable<[Repository]>
    let openURL: Observable<URL>
    
    //    private let model: ModelProtocol
    private let disposeBag = DisposeBag()
    
    init() {
        // input searchTextの初期化
        let _searchText = PublishRelay<String?>()
        self.searchText = AnyObserver<String?>() { event in
            guard let text = event.element else { return }
            _searchText.accept(text)
        }
        
        // input itemSelectedの初期化
        let _modelSelected = PublishRelay<Repository>()
        self.modelSelected = AnyObserver<Repository> { event in
            guard let model = event.element else { return }
            _modelSelected.accept(model)
        }
        
        let _searchWithText = _searchText.flatMap { text -> Observable<String> in
            guard let text = text, text.count >= 1 else {
                return .empty()
            }
            return .just(text)
        }.share()
        
        // output resultRepositoriesの初期化
        let _resultRepositories = BehaviorRelay<[Repository]>(value: [])
        self.repositories = _resultRepositories.asObservable()
        
        // output openURLの初期化
        let _openURL = PublishRelay<URL>()
        self.openURL = _openURL.asObservable()
        
        // API Request
        do {
            let model = RepositoryModel()
            let searchResult = _searchWithText.flatMap {
                text -> Observable<Event<[Repository]>> in
                model.search(query: text).asObservable().materialize()
            }.share()
            
            searchResult
                .flatMap { $0.element.map(Observable.just) ?? .empty() }
                .bind(to: _resultRepositories)
                .disposed(by: disposeBag)
            
        }
        
        _modelSelected
            .flatMap { repository -> Observable<URL> in
            return .just(repository.url)
        }.bind(to: _openURL)
            .disposed(by: disposeBag)
        
        //        query.subscribe { [weak self] event in
        //            switch event {
        //            case .next(let text):
        //                guard let q = text else { return }
        //                _ = self?.model.search(query: q).subscribe{ ev in
        //                    switch ev {
        //                    case .success(let repos):
        //                        self?.resultRepositories.accept(repos)
        //                    case .error(let error):
        //                        print(error)
        //                    }
        //                }
        //            default:
        //                break
        //            }
        //        }.disposed(by: disposeBag)
    }
}
