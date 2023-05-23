//
//  StarShipModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - Result
struct StarShipModel: ResponseModelProtocol {
    let id: UUID = UUID()
    
    var imageType: ImageNameType {
        return StarShipModelType.init(rawValue: model ?? "")?.imageType ?? .emptyImage
    }
    
    let name                : String
    let model               : String?
    let urlString           : String?
    
    let manufacturer        : String?
    let costInCredits       : String?
    let length              : String?
    let maxAtmospheringSpeed: String?
    let crew                : String?
    let passengers          : String?
    let cargoCapacity       : String?
    let hyperdriveRating    : String?
    let starshipClass       : String?
    let pilots              : [String]?
    let films               : [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case urlString              = "url"
        
        case manufacturer
        case length
        case crew
        case passengers
        case pilots
        case films
        case costInCredits          = "cost_in_credits"
        case maxAtmospheringSpeed   = "max_atmosphering_speed"
        case cargoCapacity          = "cargo_capacity"
        case hyperdriveRating       = "hyperdrive_rating"
        case starshipClass          = "starship_class"
    }
    
    var description: [String : Any] {
        return [
            "Name"                  : name,
            "Model"                 : model ?? "",
            "Cost in credits"       : costInCredits ?? "",
            "Manufacturer"          : manufacturer ?? "",
            "Length"                : length ?? "",
            "Max atmosphering speed": maxAtmospheringSpeed ?? "",
            "Crew"                  : crew ?? "",
            "Passengers"            : passengers ?? "",
            "Cargo capacity"        : cargoCapacity ?? "",
            "Starship class"        : starshipClass ?? "",
            "Hyperdrive rating"     : hyperdriveRating ?? "",
            "Films"                 : films ?? [],
            "Pilots"                : pilots ?? []
        ]
    }
}
