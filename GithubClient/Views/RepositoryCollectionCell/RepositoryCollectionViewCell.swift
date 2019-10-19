//
//  RepositoryCollectionViewCell.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/22.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import UIKit
import RxSwift
import SwiftIcons

class RepositoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var repositoryLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starNumLabel: UILabel!
    @IBOutlet private weak var languageColorView: UIView!
    @IBOutlet weak var favButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    func setup(repository: Repository) {
        repositoryLabel.text = repository.repositoryName
        descriptionLabel.text = repository.description
        languageLabel.text = repository.language
        starNumLabel.text = repository.starNum.description
        favorite()
    }
    
    func favorite() {
        favButton.tintColor = .systemPink
        let fillFavIcon = UIImage(bgIcon: .fontAwesomeSolid(.heart), bgTextColor: .systemPink, bgBackgroundColor: .clear, topIcon: .fontAwesomeSolid(.heart), topTextColor: .clear)

        favButton.setBackgroundImage(fillFavIcon, for: .normal)
    }
    
    func unfavorite() {
        favButton.tintColor = .lightGray
        let favIcon = UIImage(bgIcon: .fontAwesomeRegular(.heart), bgTextColor: .lightGray, bgBackgroundColor: .clear, topIcon: .fontAwesomeRegular(.heart), topTextColor: .clear)
        favButton.setBackgroundImage(favIcon, for: .normal)
        favButton.tintColor = .lightGray
    }
    
}
