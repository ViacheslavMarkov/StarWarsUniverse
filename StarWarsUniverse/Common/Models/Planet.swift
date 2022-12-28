//
//  Planet.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - Planet
struct Planet: Codable {
    let name            : String
    let rotationPeriod  : String
    let orbitalPeriod   : String
    let diameter        : String
    let climate         : String
    let gravity         : String
    let terrain         : String
    let surfaceWater    : String
    let population      : String
    let residents       : [String]
    let films           : [String]
    let created         : String
    let edited          : String
    let url             : String

//    enum CodingKeys: String, CodingKey {
//        case name
//        case rotationPeriod
//        case orbitalPeriod
//        case diameter, climate, gravity, terrain
//        case surfaceWater
//        case population, residents, films, created, edited, url
//    }
}
