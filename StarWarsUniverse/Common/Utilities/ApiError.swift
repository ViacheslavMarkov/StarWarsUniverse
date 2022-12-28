//
//  ApiError.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

enum ApiError: Error, LocalizedError {
    case noData
    case wrongType(String)
    case server(Error)
    case response(Int)
    case message(String)
}

extension ApiError {
    var errorMessage: String {
        switch self {
        case .server(let error):
            return error.localizedDescription
        case .response(let statusCode):
            return "Your status code is \(statusCode)"
        case .noData:
            return "No DATA"
        case .wrongType(let typeName):
            return "Your type \(typeName) is wrong"
        case .message(let message):
            return message
        }
    }
    
}
