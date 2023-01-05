//
//  StarShip.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - Result
struct StarShip: Codable {
    let name                : String
    let model               : StarShipModelType
    let manufacturer        : String
    let costInCredits       : String
    let length              : String
    let maxAtmospheringSpeed: String
    let crew                : String
    let passengers          : String
    let cargoCapacity       : String
    let hyperdriveRating    : String
    let starshipClass       : String
    let pilots              : [String]
    let films               : [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits          = "cost_in_credits"
        case length
        case maxAtmospheringSpeed   = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity          = "cargo_capacity"
        case hyperdriveRating       = "hyperdrive_rating"
        case starshipClass          = "starship_class"
        case pilots
        case films
    }
}
