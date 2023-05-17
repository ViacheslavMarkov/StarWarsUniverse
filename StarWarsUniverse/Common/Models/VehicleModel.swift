//
//  VehicleModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

struct VehicleModel: ResponseModelProtocol {
    let id: UUID = UUID()
    
    var imageType: ImageNameType {
        return VehicleType.init(rawValue: model ?? "")?.imageType ?? .unknown
    }
    
    var name            : String
    let model           : String?
    let urlString       : String?
    let averageHeight   : String?
    let averageLifespan : String?
    let designation     : String?
    let eyeColors       : String?
    let films           : [String]?
    let hairColors      : String?
    let homeWorld       : String?
    let language        : String?
    let people          : [String]?
    let skinColors      : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case designation
        case films
        case language
        case people
        case urlString      = "url"
        case averageHeight  = "average_height"
        case averageLifespan = "average_lifespan"
        case eyeColors      = "eye_colors"
        case hairColors     = "hair_colors"
        case homeWorld      = "homeworld"
        case skinColors     = "skin_colors"
    }
    
    var description: [String : Any] {
        return [
            "Name"              : name,
            "Model"             : model ?? "",
            "Average height"    : averageHeight ?? "",
            "Average lifespan"  : averageLifespan ?? "",
            "Designation"       : designation ?? "",
            "Eye colors"        : eyeColors ?? "",
            "Films"             : films ?? [],
            "Hair colors"       : hairColors ?? "",
            "Homeworld"         : homeWorld ?? "",
            "Language"          : language ?? "",
            "People"            : people ?? [],
            "Skin colors"       : skinColors ?? ""
        ]
    }
}
