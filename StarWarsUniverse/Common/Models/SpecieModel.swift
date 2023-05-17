//
//  SpecieModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

struct SpecieModel: ResponseModelProtocol {
    let id: UUID = UUID()
    
    var imageType: ImageNameType {
        return SpecieType.init(rawValue: classification ?? "")?.imageType ?? .unknown
    }
    
    let name                : String
    let classification      : String?
    let urlString           : String?
    
    let cargoCapacity       : String?
    let consumables         : String?
    let costInCredits       : String?
    let crew                : String?
    let films               : [String]?
    let people              : [String]?
    let length              : String?
    let manufacturer        : String?
    let maxAtmospheringSpeed: String?
    let passengers          : String?
    let vehicleClass        : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case classification
        case urlString              = "url"
        
        case consumables
        case crew
        case films
        case people
        case length
        case manufacturer
        case passengers
        case cargoCapacity          = "cargo_capacity"
        case costInCredits          = "cost_in_credits"
        case maxAtmospheringSpeed   = "max_atmosphering_speed"
        case vehicleClass           = "vehicle_class"
    }
    
    var description: [String : Any] {
        return [
            "Name"                  : name,
            "Classification"        : classification ?? "",
            "Consumables"           : consumables ?? "",
            "Crew"                  : crew ?? "",
            "Films"                 : films ?? [],
            "People"                : people ?? [],
            "Length"                : length ?? "",
            "Manufacturer"          : manufacturer ?? "",
            "Passengers"            : passengers ?? "",
            "Cargo capacity"        : cargoCapacity ?? "",
            "Cost in credits"       : costInCredits ?? "",
            "Max atmosphering speed": maxAtmospheringSpeed ?? "",
            "Vehicle class"         : vehicleClass ?? ""
        ]
    }
}
