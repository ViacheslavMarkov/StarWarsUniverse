//
//  SpecieResponse.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

struct SpecieResponse: RequestResponseProtocol {
    typealias T = SpecieModel
    
    let id: UUID = UUID()
    
    let count: Int?
    let next: String?
    let previous: String?
    let results: [T]
}
