//
//  VehicleType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

enum VehicleType: String, Codable {
    case diggerCrawler = "Digger Crawler"
    
    var imageType: ImageNameType {
        switch self {
        case .diggerCrawler:
            return .diggerCrawler
        default:
            return .diggerCrawler
        }
    }
}
