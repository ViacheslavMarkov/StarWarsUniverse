//
//  ClimateType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 02.01.2023.
//

import Foundation

enum ClimateType: String, Codable {
    case arid                   = "arid"
    case temperate              = "temperate"
    case frozen                 = "frozen"
    case murky                  = "murky"
    case hot                    = "hot"
    case tropical               = "tropical"
    case frigid                 = "frigid"
    case polluted               = "polluted"
    case unknown                = "unknown"
    case superheated            = "superheated"
    case artificialTemperate    = "artificial temperate "
    
    case temperateTropical      = "temperate, tropical"
    case hotHumid               = "hot, humid"
    case temperateMoist         = "temperate, moist"
    case temperateArid          = "temperate, arid"
    case temperateArtic         = "temperate, artic"
    case tropicalTemperate      = "tropical, temperate"
    
    case temperateAridWindy     = "temperate, arid, windy"
    case aridRockyWindy         = "arid, rocky, windy"
    case temperateAridSubartic  = "temperate, arid, subartic"
    case aridTemperateTropical  = "arid, temperate, tropical"
    
    var imageType: ImageNameType {
        switch self {
        case .arid,
                .hot,
                .hotHumid,
                .aridRockyWindy,
                .aridTemperateTropical:
            return .aridClimate
        case .temperate,
                .artificialTemperate,
                .temperateMoist,
                .temperateArid,
                .tropicalTemperate,
                .temperateTropical,
                .temperateAridWindy:
            return .temperateClimate
        case .frozen,
                .temperateArtic,
                .temperateAridSubartic:
            return .frozenClimate
        case .tropical:
            return .tropicalClimate
        case .frigid:
            return .frigidClimate
        case .polluted, .murky:
            return .pollutedClimate
        case .unknown:
            return .unknownClimate
        case .superheated:
            return .superheaterClimate
        }
    }
}
