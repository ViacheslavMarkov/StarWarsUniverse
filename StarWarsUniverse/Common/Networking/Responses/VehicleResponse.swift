//
//  VehicleResponse.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

struct VehicleResponse: RequestResponseProtocol {
    typealias T = VehicleModel
    
    let id: UUID = UUID()
    
    let count: Int?
    let next: String?
    let previous: String?
    let results: [T]
}
