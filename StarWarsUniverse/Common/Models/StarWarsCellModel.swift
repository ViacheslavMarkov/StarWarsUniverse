//
//  StarWarsCellModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import Foundation

struct StarWarsCellModel: Hashable {
    let name: String?
    let imageNameType: ImageNameType?
    
    init(
        name: String?,
        imageNameType: ImageNameType?
    ) {
        self.name = name
        self.imageNameType = imageNameType
    }
}
