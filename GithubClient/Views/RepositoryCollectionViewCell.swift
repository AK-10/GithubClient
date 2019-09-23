//
//  RepositoryCollectionViewCell.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/22.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import UIKit

class RepositoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var repositoryLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starNumLabel: UILabel!
    @IBOutlet private weak var languageColorView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repositoryLabel.text = ""
        descriptionLabel.text = ""
        languageLabel.text = ""
        starNumLabel.text = ""
        languageColorView.backgroundColor = .white
    }
    
}
