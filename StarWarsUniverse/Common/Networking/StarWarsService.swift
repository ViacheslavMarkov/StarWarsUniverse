//
//  StarWarsService.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

protocol StarWarsServiceProtocol {
    func fetchData<T: Codable>(by urlString: String, completion: @escaping (_ result: Result<T, ApiError>) -> Void)
}

final class StarWarsService: StarWarsServiceProtocol {
    
    static let shared: StarWarsServiceProtocol = StarWarsService()
    
    func fetchData<T: Codable>(
        by urlString: String,
        completion: @escaping (_ result: Result<T, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.defaultAPI(urlString: urlString).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<T, ApiError>) in
            completion(result)
        }
    }
}
