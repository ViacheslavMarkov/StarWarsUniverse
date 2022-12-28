//
//  StarWarsCellModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import Foundation

struct StarWarsCellModel: Hashable {
    let userImageString      : String?
    
    init(
        userImageString     : String? = ""
    ) {
        self.userImageString    = userImageString
    }
}
