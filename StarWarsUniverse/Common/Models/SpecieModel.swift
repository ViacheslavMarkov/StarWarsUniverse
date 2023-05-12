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
        return classification?.imageType ?? ImageNameType.addButton
//        return ImageNameType.mammal
    }
    
    let name            : String
    let classification  : SpecieType?
    let urlString       : String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case classification
        case urlString      = "url"
    }
}
