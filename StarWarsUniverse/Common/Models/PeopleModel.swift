//
//  PeopleModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - People
struct PeopleModel: ResponseModelProtocol {
    let id: UUID = UUID()
    
    var imageType: ImageNameType {
        return GenderType.init(rawValue: gender ?? "")?.imageType ?? .unknown
    }
    
    let name        : String
    let gender      : String?
    let urlString   : String?
    
    let height      : String?
    let mass        : String?
    let films       : [String]?
    let species     : [String]?
    let vehicles    : [String]?
    let starships   : [String]?
    let hairColor   : String?
    let skinColor   : String?
    let eyeColor    : String?
    let birthYear   : String?
    let homeWorld   : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case urlString  = "url"
        
        case height
        case mass
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
    
    var description: [String : Any] {
        return [
            "Name"      : name,
            "Skin color": skinColor ?? "",
            "Height"    : height ?? "",
            "Birth year": birthYear ?? "",
            "Home world": homeWorld ?? "",
            "Mass"      : mass ?? "",
            "Hair color": hairColor ?? "",
            "Gender"    : gender ?? "",
            "Films"     : films ?? [],
            "Species"   : species ?? [],
            "Starships" : starships ?? []
        ]
    }
}
