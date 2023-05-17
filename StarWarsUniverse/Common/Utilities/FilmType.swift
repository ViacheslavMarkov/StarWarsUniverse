//
//  FilmType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 17.05.2023.
//

import Foundation

enum FilmType: String, Codable {
    case film
    
    var imageType: ImageNameType {
        return .filmIcon
    }
}
