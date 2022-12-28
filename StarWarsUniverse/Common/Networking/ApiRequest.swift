//
//  ApiRequest.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

enum ApiRequest {
    case people(page: Int)
    case person(number: Int)
    
    case planets(page: Int)
    case planet(number: Int)
    
    case starships(page: Int)
    case starship(number: Int)
    
    var url: String {
        switch self {
        case .people(page: let page):
            return EndPoint.people.urlString + "\(page)"
        case .person(number: let number):
            return EndPoint.person.urlString + "\(number)"
        case .planets(page: let page):
            return EndPoint.planets.urlString + "\(page)"
        case .planet(number: let number):
            return EndPoint.planet.urlString + "\(number)"
        case .starships(page: let page):
            return EndPoint.starships.urlString + "\(page)"
        case .starship(number: let number):
            return EndPoint.starship.urlString + "\(number)"
        }
    }
    
    var httpMethod: String {
        switch self {
        case .people,
                .person,
                .planets,
                .planet,
                .starships,
                .starship:
            return "GET"
        }
    }
    
    var bodyParams: Data? {
        switch self {
        case .people,
                .person,
                .planets,
                .planet,
                .starships,
                .starship:
            return nil
        }
    }
    
    var headerFields: [String: String]? {
        switch self {
        case .people,
                .person,
                .planets,
                .planet,
                .starships,
                .starship:
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
        case .people,
                .person,
                .planets,
                .planet,
                .starships,
                .starship:
            break
        }
        return request
    }
}
