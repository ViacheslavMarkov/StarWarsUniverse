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
    case person     = "people/"
    
    case planets    = "planets/?page="
    case planet     = "planets/"
    
    case films      = "films?page="
    case film       = "films/"
    
    case starships  = "starships?page="
    case starship   = "starships/"
    
    case vehicles   = "vehicles?page="
    case vehicle    = "vehicles/"
    
    case species    = "species?page="
    case specie     = "species/"
    
    var url: URL? {
        return URL(string: baseURL + self.rawValue)
    }
    
    var urlString: String {
        return baseURL + self.rawValue
    }
}
