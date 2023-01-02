//
//  GenderType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

enum GenderType: String, Codable {
    case female = "female"
    case male = "male"
    case nA = "n/a"
    case hermaphrodite = "hermaphrodite"
    case none = "none"
    
    var imageType: ImageNameType {
        switch self {
        case .female:
            return .femaleGender
        case .male:
            return .maleGender
        case .nA:
            return .naGender
        case .hermaphrodite:
            return .hermaphroditeGender
        case .none:
            return .noneGender
        }
    }
}
