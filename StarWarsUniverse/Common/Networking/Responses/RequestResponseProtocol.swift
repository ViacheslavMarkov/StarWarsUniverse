//
//  RequestResponseProtocol.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

protocol RequestResponseProtocol: Codable, Identifiable {
    associatedtype T
    
    var id: UUID { get }
    var count: Int? { get }
    var next: String? { get }
    var previous: String? { get }
    var results : [T] { get }
}
