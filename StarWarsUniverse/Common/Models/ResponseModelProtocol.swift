//
//  ResponseModelProtocol.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 11.05.2023.
//

import Foundation

protocol ResponseModelProtocol: Identifiable, Codable {
    var id: UUID { get }
    var name: String { get }
    var imageType: ImageNameType { get }
    var urlString: String? { get }
}
