//
//  PeopleResponse.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

// MARK: - PeopleResponse
struct PeopleResponse: Codable {
    let count   : Int
    let next    : String?
//    let previous: String?
    let results : [People]
}
