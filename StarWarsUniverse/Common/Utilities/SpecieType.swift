//
//  SpecieType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

enum SpecieType: String, Codable {
    case mammal = "mammal"
    
    var imageType: ImageNameType {
        switch self {
        case .mammal:
            return .mammal
        default:
            return .diggerCrawler
        }
    }
}
