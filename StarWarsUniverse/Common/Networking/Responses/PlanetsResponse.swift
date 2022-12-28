//
//  PlanetsResponse.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - PlanetsResponse
struct PlanetsResponse: Codable {
    let count   : Int
    let next    : String?
    let previous: String?
    let results : [Planet]
}
