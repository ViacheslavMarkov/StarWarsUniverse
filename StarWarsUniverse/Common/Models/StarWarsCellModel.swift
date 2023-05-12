//
//  StarWarsCellModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import Foundation

struct StarWarsCellModel: Hashable {
    let name            : String?
    let imageNameType   : ImageNameType?
    let urlString       : String?
    
    init(
        name            : String?,
        imageNameType   : ImageNameType?,
        urlString       : String?
    ) {
        self.name           = name
        self.imageNameType  = imageNameType
        self.urlString      = urlString
    }
}
