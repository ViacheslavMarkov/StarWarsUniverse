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
    
    var name        : String
    let model       : String?
    let urlString   : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case urlString = "url"
    }
    
    var description: [String : Any] {
        return [:]
    }
}
