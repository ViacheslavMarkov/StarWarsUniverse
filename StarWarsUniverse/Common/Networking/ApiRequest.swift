//
//  ApiRequest.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

enum ApiRequest {
    case defaultAPI(urlString: String)
    
    var url: String {
        switch self {
        case .defaultAPI(urlString: let urlString):
            return urlString
        }
    }
    
    var httpMethod: String {
        switch self {
        case .defaultAPI:
            return "GET"
        }
    }
    
    var bodyParams: Data? {
        switch self {
        case .defaultAPI:
            return nil
        }
    }
    
    var headerFields: [String: String]? {
        switch self {
        case .defaultAPI:
            return nil
        }
    }
    
    var request: URLRequest? {
        guard let url = URL(string: self.url) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = headerFields
        
        switch self {
        case .defaultAPI:
            break
        }
        return request
    }
}
