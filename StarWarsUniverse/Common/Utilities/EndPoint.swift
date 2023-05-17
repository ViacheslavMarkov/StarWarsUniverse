//
//  EndPoint.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

protocol EndPointProtocol {
    var url: URL? { get }
}

extension EndPointProtocol {
    var baseURL: String {
        return "https://swapi.dev/api/"
    }
}

enum EndPoint: String, EndPointProtocol {
    case people     = "people/?page="
    case planets    = "planets/?page="
    case films      = "films?page="
    
    case starships  = "starships?page="
    case vehicles   = "vehicles?page="
    case species    = "species?page="
    
    case defaultAPI = ""
    
    var url: URL? {
        return URL(string: baseURL + self.rawValue)
    }
    
    var urlString: String {
        return baseURL + self.rawValue
    }
}
