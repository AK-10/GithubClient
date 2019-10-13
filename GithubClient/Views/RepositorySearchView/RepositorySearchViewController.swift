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
    private lazy var viewModel = RepositorySearchViewModel(searchWordObservable: searchBar.rx.text.asObservable())
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        repositoryCollectionView.register(UINib(nibName: "RepositoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RepoCell")
        
        viewModel.resultRepositories.asDriver().drive(
        repositoryCollectionView.rx.items(cellIdentifier: "RepoCell", cellType: RepositoryCollectionViewCell.self)) { row, element, cell in
            cell.setup(repository: element)
        }.disposed(by: disposeBag)
        
        repositoryCollectionView.rx.modelSelected(Repository.self).subscribe(onNext: { [weak self] repository in
            let safariViewController = SFSafariViewController(url: repository.url)
            self?.present(safariViewController, animated: true)
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

