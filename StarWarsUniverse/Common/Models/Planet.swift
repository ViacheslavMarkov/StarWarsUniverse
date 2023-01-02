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
    let climate         : ClimateType
    let gravity         : String
    let terrain         : String?
    let surfaceWater    : String?
    let population      : String
    let residents       : [String]
    let films           : [String]

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
    }
}
