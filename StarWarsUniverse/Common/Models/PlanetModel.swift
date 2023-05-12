//
//  PlanetModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - Planet
struct PlanetModel: ResponseModelProtocol {
    let id: UUID = UUID()
    
    var imageType: ImageNameType {
        return climate?.imageType ?? ImageNameType.emptyImage
    }
    
    let name            : String
    let climate         : ClimateType?
    let urlString       : String?
    
//    let rotationPeriod  : String
//    let orbitalPeriod   : String
//    let diameter        : String
//    let gravity         : String
//    let terrain         : String?
//    let surfaceWater    : String?
//    let population      : String
//    let residents       : [String]
//    let films           : [String]

    enum CodingKeys: String, CodingKey {
        case name
        case climate
        case urlString = "url"
        
//        case rotationPeriod = "rotation_period"
//        case orbitalPeriod = "orbital_period"
//        case diameter
//        case gravity
//        case terrain
//        case surfaceWater = "surface_water"
//        case population
//        case residents
//        case films
    }
}
