//
//  People.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - People
struct People: Codable {
    let name        : String
    let height      : String
    let mass        : String
    let gender      : GenderType
    let films       : [String]
    let species     : [String]
    let vehicles    : [String]
    let starships   : [String]
    let hairColor   : String
    let skinColor   : String
    let eyeColor    : String
    let birthYear   : String
    let homeWorld   : String
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case gender
        case films
        case species
        case vehicles
        case starships
        case hairColor  = "hair_color"
        case skinColor  = "skin_color"
        case eyeColor   = "eye_color"
        case birthYear  = "birth_year"
        case homeWorld  = "homeworld"
    }
}
