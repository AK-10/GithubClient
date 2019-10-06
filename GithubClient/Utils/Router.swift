//
//  Router.swift
//  GithubClient
//
//  Created by Atsushi KONISHI on 2019/09/28.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    private static let baseURL = "https://api.github.com"
    
    case search(query: String)
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
//        default:
//            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/repositories"
//        default:
//            return "/"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let query):
            return query.isEmpty ? [] : [URLQueryItem(name: "q", value: query)]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponent = URLComponents(string: Router.baseURL)!
        urlComponent.queryItems = queryItems
        let url = try urlComponent.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        print(urlRequest.url?.absoluteURL)
        return urlRequest
    }
}
