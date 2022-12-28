//
//  StarShipResponse.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - Welcome
struct StarShipResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [StarShip]
}
