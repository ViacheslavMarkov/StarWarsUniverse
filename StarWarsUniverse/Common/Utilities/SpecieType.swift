//
//  SpecieType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

enum SpecieType: String, Codable {
    case mammal
    case mammals
    case artificial
    case sentient
    case gastropod
    case reptile
    case reptilian
    case amphibian
    case insectoid
    case unknown
    
    var imageType: ImageNameType {
        switch self {
        case .mammal, .mammals:
            return .mammal
        case.artificial, .sentient:
                return .sentientIcon
        case .gastropod:
            return .gastropod
        case .reptile, .reptilian:
            return .reptile
        case .amphibian:
            return .amphibian
        default:
            return .unknown
        }
    }
}
