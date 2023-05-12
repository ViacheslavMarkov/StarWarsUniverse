//
//  PlanetsResponse.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - PlanetsResponse
struct PlanetsResponse: RequestResponseProtocol {
    typealias T = PlanetModel
    
    let id: UUID = UUID()
    
    let count: Int?
    let next: String?
    let previous: String?
    let results: [T]
}
