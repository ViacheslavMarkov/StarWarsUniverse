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
//        return model.imageType
        return ImageNameType.diggerCrawler
    }
    
    var name        : String
    let model       : String?//VehicleType
    let urlString   : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case urlString = "url"
    }
}
