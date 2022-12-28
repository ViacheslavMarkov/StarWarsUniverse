//
//  NetworkRequestManager.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

protocol NetworkRequestManagerProtocol {
    func request<T: Codable>(request: URLRequest, completion: @escaping (Result<T, ApiError>) -> Void)
}

class NetworkRequestManager: NetworkRequestManagerProtocol {
    
    static var shared: NetworkRequestManagerProtocol = NetworkRequestManager()
    
    private init() { }
    
    public func request<T: Codable>(request: URLRequest, completion: @escaping (Result<T, ApiError>) -> Void) {
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            
            print("REQUEST - ", request)
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.server(error)))
                }
                return
            }
            
            if let response = response as? HTTPURLResponse,
               (400...500).contains(response.statusCode) {
                DispatchQueue.main.async {
                    completion(.failure(.response(response.statusCode)))
                }
                return
            }
            
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let mdata = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        print("RESPONSE - ", request, mdata)
                        let jsonItem = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(jsonItem))
                    } catch {
                        completion(.failure(.wrongType(String(describing: T.self))))
                    }
                }
            }
        }.resume()
    }
}
