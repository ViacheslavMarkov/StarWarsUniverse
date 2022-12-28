//
//  FilterType.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import Foundation

public enum FilterType: Int, CaseIterable, CustomStringConvertible {
    case people
    case planet
    case starship

    public var description: String {
        switch self {
        case .people:
            return "People"
        case .planet:
            return "Planets"
        case .starship:
            return "Starships"
        }
    }
}
