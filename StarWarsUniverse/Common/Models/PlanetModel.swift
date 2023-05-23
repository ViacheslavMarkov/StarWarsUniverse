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
        return ClimateType.init(rawValue: climate ?? "")?.imageType ?? .emptyImage
    }
    
    let name            : String
    let climate         : String?
    let urlString       : String?
    
    let rotationPeriod  : String?
    let orbitalPeriod   : String?
    let diameter        : String?
    let gravity         : String?
    let terrain         : String?
    let surfaceWater    : String?
    let population      : String?
    let residents       : [String]?
    let films           : [String]?

    enum CodingKeys: String, CodingKey {
        case name
        case climate
        case urlString = "url"
        
        case diameter
        case gravity
        case terrain
        case population
        case residents
        case films
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case surfaceWater = "surface_water"
    }
    
    var description: [String : Any] {
        return [
            "Name"          : name,
            "Population"    : population ?? "",
            "Diameter"      : diameter ?? "",
            "Gravity"       : gravity ?? "",
            "Orbital period": orbitalPeriod ?? "",
            "Climate"       : climate ?? "",
            "Rotation period": rotationPeriod ?? "",
            "Films"         : films ?? [],
            "Residents"     : residents ?? [],
            "Terrain"       : terrain ?? "",
            "Surface water" : surfaceWater ?? ""
        ]
    }
}
