//
//  ModelProtocol.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/23.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation
import RxSwift

protocol ModelProtocol {
    func search(query: String) -> Single<[Repository]>
    func favorite()
}
