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
    
    let name            : String
    let classification  : String?
    let urlString       : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case classification
        case urlString      = "url"
    }
    
    var description: [String : Any] {
        return [:]
    }
}
