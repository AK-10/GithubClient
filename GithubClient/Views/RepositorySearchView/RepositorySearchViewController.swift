//
//  ViewController.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/22.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

class RepositorySearchViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet weak var repositoryCollectionView: UICollectionView!
    private lazy var viewModel = RepositorySearchViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind()
        
    }
    
    private func bind() {
        repositoryCollectionView.register(UINib(nibName: "RepositoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RepoCell")
        
        searchBar.rx.text.asObservable().bind(to: viewModel.searchText).disposed(by: disposeBag)
        
        viewModel.repositories.bind(to: repositoryCollectionView.rx.items(cellIdentifier: "RepoCell", cellType: RepositoryCollectionViewCell.self)) { _, element, cell in
            cell.setup(repository: element)
        }.disposed(by: disposeBag)
       
        
        repositoryCollectionView.rx.modelSelected(Repository.self)
            .bind(to: viewModel.modelSelected)
            .disposed(by: disposeBag)
        
//        repositoryCollectionView.rx.itemSelected
//            .bind(to: viewModel.itemSelected)
//            .disposed(by: disposeBag)
        
        
        
        viewModel.openURL.bind(to: Binder(self) { me, url in
            let safariVC = SFSafariViewController(url: url)
            me.present(safariVC, animated: true)
            }).disposed(by: disposeBag)
    }
    
    private func setupUI() {
        let flowLayout = UICollectionViewFlowLayout()
        
        print(view.bounds.width)
        print(view.bounds.width / 10 * 9)
        let itemWidth = view.bounds.width / 10 * 9
        let itemHeight = itemWidth / 2
        flowLayout.minimumLineSpacing = 24.0
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        
        repositoryCollectionView.collectionViewLayout = flowLayout
    }
}

